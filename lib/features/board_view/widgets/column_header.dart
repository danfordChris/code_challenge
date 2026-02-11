import 'package:code_challenge/core/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

class ColumnHeader extends StatelessWidget {
  final String title;
  final Color color;
  final int taskCount;

  const ColumnHeader({required this.title, required this.color, required this.taskCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          Text(title, style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(color: color.withAlpha(25), borderRadius: BorderRadius.circular(12)),
            child: Text(
              taskCount.toString(),
              style: context.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w600, color: color),
            ),
          ),
        ],
      ),
    );
  }
}
