import 'package:code_challenge/core/extensions/build_context_extensions.dart';
import 'package:code_challenge/core/utils/date_formatter.dart';
import 'package:code_challenge/features/board_view/controller/task_controller.dart';
import 'package:code_challenge/features/board_view/widgets/priority_badge.dart';
import 'package:code_challenge/features/board_view/widgets/task_sheet.dart';
import 'package:code_challenge/models/task_model.dart';
import 'package:code_challenge/services/localization_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskCard extends ConsumerWidget {
  final TaskModel task;
  final Color color;
  final bool isDraggable;
  final String boardId;
  final bool isHighlighted;

  const TaskCard({super.key, required this.task, required this.color, this.isDraggable = false, required this.boardId, this.isHighlighted = false});

  void _editTask(BuildContext context, WidgetRef ref) {
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
            child: TaskSheet(task: task, boardId: boardId),
          ),
        );
      },
    );
  }

  void _deleteTask(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(Strings.instance.deleteTask),
        content: Text(Strings.instance.deleteTaskQuestion),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(Strings.instance.cancel)),
          TextButton(
            onPressed: () {
              ref.read(tasksProvider.notifier).deleteTask(TaskModel(id: task.id));
              Navigator.pop(context);
            },
            child: Text(Strings.instance.delete),
          ),
        ],
      ),
    );
  }

  void _moveTask(BuildContext context, WidgetRef ref, TaskStatus newStatus) {
    task.status = newStatus.value;
    ref.read(tasksProvider.notifier).updateTask(task);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: isHighlighted ? color.withOpacity(0.1) : context.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: isHighlighted ? color : context.colorScheme.outline.withOpacity(0.1), width: isHighlighted ? 2 : 1),
        boxShadow: [BoxShadow(color: context.colorScheme.onSurface.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))],
      ),
      child: PopupMenuButton<PopupMenuOptions>(
        onSelected: (option) {
          switch (option) {
            case PopupMenuOptions.edit:
              _editTask(context, ref);
              break;
            case PopupMenuOptions.delete:
              _deleteTask(context, ref);
              break;
            case PopupMenuOptions.todo:
              _moveTask(context, ref, TaskStatus.todo);
              break;
            case PopupMenuOptions.inProgress:
              _moveTask(context, ref, TaskStatus.inProgress);
              break;
            case PopupMenuOptions.done:
              _moveTask(context, ref, TaskStatus.done);
              break;
          }
        },
        itemBuilder: (context) => [
          const PopupMenuItem<PopupMenuOptions>(
            value: PopupMenuOptions.edit,
            child: ListTile(leading: Icon(Icons.edit_outlined, size: 20), title: Text('Edit')),
          ),
          const PopupMenuDivider(),
          PopupMenuItem<PopupMenuOptions>(
            value: PopupMenuOptions.todo,
            child: ListTile(
              leading: Icon(Icons.circle_outlined, size: 20, color: Colors.blue),
              title: const Text('To Do'),
            ),
          ),
          PopupMenuItem<PopupMenuOptions>(
            value: PopupMenuOptions.inProgress,
            child: ListTile(
              leading: Icon(Icons.circle_outlined, size: 20, color: Colors.orange),
              title: const Text('In Progress'),
            ),
          ),
          PopupMenuItem<PopupMenuOptions>(
            value: PopupMenuOptions.done,
            child: ListTile(
              leading: Icon(Icons.circle_outlined, size: 20, color: Colors.green),
              title: const Text('Done'),
            ),
          ),
          const PopupMenuDivider(),
          PopupMenuItem<PopupMenuOptions>(
            value: PopupMenuOptions.delete,
            child: ListTile(
              leading: Icon(Icons.delete_outline, size: 20, color: Colors.red),
              title: const Text('Delete'),
            ),
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TaskHeader(task: task),
              if (task.description != null) ...[const SizedBox(height: 8), _TaskDescription(description: task.description!)],
              const SizedBox(height: 12),
              _TaskFooter(task: task),
            ],
          ),
        ),
      ),
    );
  }
}

class _TaskHeader extends StatelessWidget {
  final TaskModel task;

  const _TaskHeader({required this.task});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            task.title ?? '',
            style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        PriorityBadge(priority: TaskPriority.fromValue(task.priority)),
      ],
    );
  }
}

class _TaskDescription extends StatelessWidget {
  final String description;

  const _TaskDescription({required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _TaskFooter extends StatelessWidget {
  final TaskModel task;

  const _TaskFooter({required this.task});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          DateFormatter.formatDate(DateTime.tryParse(task.updatedAt ?? '') ?? DateTime.now()),
          style: context.textTheme.labelSmall?.copyWith(color: context.colorScheme.onSurfaceVariant),
        ),
        Icon(Icons.drag_handle, size: 16, color: context.colorScheme.onSurfaceVariant),
      ],
    );
  }
}
