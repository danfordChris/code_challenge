import 'package:code_challenge/core/extensions/build_context_extensions.dart';
import 'package:code_challenge/features/board_view/controller/task_controller.dart';
import 'package:code_challenge/features/board_view/widgets/column_header.dart';
import 'package:code_challenge/features/board_view/widgets/task_card.dart';
import 'package:code_challenge/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskColumn extends ConsumerStatefulWidget {
  final String title;
  final TaskStatus status;
  final Color color;
  final double width;
  final String boardId;

  const TaskColumn({super.key, required this.title, required this.status, required this.color, required this.width, required this.boardId});

  @override
  ConsumerState<TaskColumn> createState() => _TaskColumnState();
}

class _TaskColumnState extends ConsumerState<TaskColumn> {
  TaskModel? _draggedTask;
  TaskStatus? _draggedTaskOriginalStatus;

  List<TaskModel> _getTasksByStatus() {
    final tasks = ref.watch(tasksProvider).tasks;
    return tasks.where((task) => task.status == widget.status.value).toList();
  }

  void _moveTask(TaskModel task, TaskStatus newStatus) {
    task.status = newStatus.value;
    ref.read(tasksProvider.notifier).updateTask(task);
  }

  @override
  Widget build(BuildContext context) {
    final tasks = _getTasksByStatus();
    final isTargeted = _draggedTask != null && _draggedTaskOriginalStatus != null && _draggedTaskOriginalStatus != widget.status;

    return SizedBox(
      width: widget.width,
      child: DragTarget<TaskModel>(
        onWillAcceptWithDetails: (details) {
          return details.data.status != widget.status.value;
        },
        onAcceptWithDetails: (details) {
          final task = details.data;
          _moveTask(task, widget.status);
          setState(() {
            _draggedTask = null;
            _draggedTaskOriginalStatus = null;
          });
        },
        builder: (context, candidateData, rejectedData) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isTargeted ? widget.color.withOpacity(0.5) : context.colorScheme.outline.withAlpha(25),
                width: isTargeted ? 2 : 1,
              ),
              boxShadow: isTargeted ? [BoxShadow(color: widget.color.withOpacity(0.2), blurRadius: 8, spreadRadius: 1)] : [],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ColumnHeader(title: widget.title, color: widget.color, taskCount: tasks.length),
                Expanded(
                  child: TaskListView(
                    boardId: widget.boardId,
                    tasks: tasks,
                    columnColor: widget.color,
                    columnWidth: widget.width,
                    onDragStarted: (task) {
                      setState(() {
                        _draggedTask = task;
                        _draggedTaskOriginalStatus = TaskStatus.fromValue(task.status);
                      });
                    },
                    onDragEnd: () {
                      setState(() {
                        _draggedTask = null;
                        _draggedTaskOriginalStatus = null;
                      });
                    },
                    isDraggedTask: (task) => _draggedTask?.id == task.id,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class TaskListView extends StatelessWidget {
  final List<TaskModel> tasks;
  final String boardId;
  final Color columnColor;
  final double columnWidth;
  final void Function(TaskModel) onDragStarted;
  final VoidCallback onDragEnd;
  final bool Function(TaskModel) isDraggedTask;

  const TaskListView({
    super.key,
    required this.tasks,
    required this.columnColor,
    required this.columnWidth,
    required this.onDragStarted,
    required this.onDragEnd,
    required this.isDraggedTask,
    required this.boardId,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        final isDragging = isDraggedTask(task);

        return Draggable<TaskModel>(
          data: task,
          feedback: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(8),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: columnWidth - 32),
              child: Opacity(
                opacity: 0.9,
                child: TaskCard(task: task, color: columnColor, isDraggable: true, boardId: boardId),
              ),
            ),
          ),
          childWhenDragging: Opacity(
            opacity: 0.3,
            child: TaskCard(task: task, color: columnColor, boardId: boardId),
          ),
          onDragStarted: () => onDragStarted(task),
          onDragEnd: (details) => onDragEnd(),
          child: TaskCard(task: task, color: columnColor, boardId: boardId),
        );
      },
    );
  }
}
