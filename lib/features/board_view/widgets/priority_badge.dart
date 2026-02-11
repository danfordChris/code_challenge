import 'package:code_challenge/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:ipf_flutter_starter_pack/ipf_flutter_starter_pack.dart';

class PriorityBadge extends StatelessWidget {
  final TaskPriority priority;

  const PriorityBadge({super.key, required this.priority});

  @override
  Widget build(BuildContext context) {
    final config = _getPriorityConfig();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(color: config.color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
      child: Text(
        config.label,
        style: context.textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w600, color: config.color),
      ),
    );
  }

  _PriorityConfig _getPriorityConfig() {
    switch (priority) {
      case TaskPriority.high:
        return _PriorityConfig(color: Colors.red, label: 'High');
      case TaskPriority.medium:
        return _PriorityConfig(color: Colors.orange, label: 'Medium');
      case TaskPriority.low:
        return _PriorityConfig(color: Colors.green, label: 'Low');
    }
  }
}

class _PriorityConfig {
  final Color color;
  final String label;

  _PriorityConfig({required this.color, required this.label});
}
