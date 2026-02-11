import 'package:code_challenge/core/extensions/build_context_extensions.dart';
import 'package:code_challenge/features/board_view/screens/task_board_screen.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class BoardCard extends StatelessWidget {
  final String boardId;
  final String boardName;
  final String discription;
  final int taskCount;
  final DateTime lastUpdated;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const BoardCard({
    super.key,
    required this.boardId,
    required this.boardName,
    required this.taskCount,
    required this.discription,
    required this.lastUpdated,
    required this.onEdit,
    required this.onDelete,
  });

  String _getTimeAgo(DateTime date) {
    final difference = DateTime.now().difference(date);
    if (difference.inDays > 0) return '${difference.inDays}d ago';
    if (difference.inHours > 0) return '${difference.inHours}h ago';
    if (difference.inMinutes > 0) return '${difference.inMinutes}m ago';
    return 'Just now';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TaskBoardScreen(boardId: boardId, boardName: boardName),
          ),
        );
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: context.colorScheme.outline.withOpacity(0.1), width: 1),
            boxShadow: [BoxShadow(color: context.colorScheme.onSurface.withOpacity(0.05), blurRadius: 12, offset: const Offset(0, 4))],
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          boardName,
                          style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600, color: context.colorScheme.onSurface),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          discription,
                          style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600, color: context.colorScheme.outline),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == BoardMenuOption.edit.name) {
                        onEdit();
                      } else if (value == BoardMenuOption.delete.name) {
                        onDelete();
                      }
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: BoardMenuOption.edit.name,
                        child: Text('Edit', style: TextStyle(color: context.colorScheme.onSurface)),
                      ),
                      PopupMenuItem(
                        value: BoardMenuOption.delete.name,
                        child: Text('Delete', style: TextStyle(color: context.colorScheme.onSurface)),
                      ),
                    ],
                    icon: HugeIcon(icon: HugeIcons.strokeRoundedMoreVerticalCircle01, color: context.colorScheme.onSurfaceVariant, size: 20),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: context.colorScheme.primary.withOpacity(0.1), shape: BoxShape.circle),
                    child: HugeIcon(icon: HugeIcons.strokeRoundedNote02, color: context.colorScheme.primary, size: 18),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$taskCount Tasks',
                          style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500, color: context.colorScheme.onSurface),
                        ),
                        const SizedBox(height: 4),
                        LinearProgressIndicator(
                          value: 0.6, // You can calculate this from actual data
                          backgroundColor: context.colorScheme.outline.withOpacity(0.1),
                          color: context.colorScheme.primary,
                          borderRadius: BorderRadius.circular(10),
                          minHeight: 6,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(color: context.colorScheme.surfaceVariant, borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Icon(Icons.access_time_outlined, size: 12, color: context.colorScheme.onSurfaceVariant),
                        const SizedBox(width: 4),
                        Text(
                          _getTimeAgo(lastUpdated),
                          style: context.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w500, color: context.colorScheme.onSurfaceVariant),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum BoardMenuOption { edit, delete }
