import 'package:code_challenge/core/extensions/build_context_extensions.dart';
import 'package:code_challenge/features/board_view/controller/task_controller.dart';
import 'package:code_challenge/features/board_view/widgets/statistics_bar.dart';
import 'package:code_challenge/features/board_view/widgets/task_column.dart';
import 'package:code_challenge/features/board_view/widgets/task_sheet.dart';
import 'package:code_challenge/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

class TaskBoardScreen extends ConsumerStatefulWidget {
  final String boardId;
  final String boardName;

  const TaskBoardScreen({super.key, required this.boardId, required this.boardName});

  @override
  ConsumerState<TaskBoardScreen> createState() => _TaskBoardScreenState();
}

class _TaskBoardScreenState extends ConsumerState<TaskBoardScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(tasksProvider.notifier).loadTasksByBoardId(widget.boardId);
    });
  }

  void _addTask() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Material(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: TaskSheet(boardId: widget.boardId),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.boardName),
        actions: [
          IconButton(
            onPressed: _addTask,
            icon: HugeIcon(icon: HugeIcons.strokeRoundedAdd01, color: context.colorScheme.onSurfaceVariant, size: 20),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TaskStatisticsBar(),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  TaskColumn(title: 'To Do', status: TaskStatus.todo, color: Colors.blue, width: context.width * 0.6, boardId: widget.boardId),
                  SizedBox(width: 16),
                  TaskColumn(
                    title: 'In Progress',
                    status: TaskStatus.inProgress,
                    color: Colors.orange,
                    width: context.width * 0.6,
                    boardId: widget.boardId,
                  ),
                  SizedBox(width: 16),
                  TaskColumn(title: 'Done', status: TaskStatus.done, color: Colors.green, width: context.width * 0.6, boardId: widget.boardId),
                  SizedBox(width: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
