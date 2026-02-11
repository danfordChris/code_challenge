import 'package:code_challenge/features/board_view/controller/task_controller.dart';
import 'package:code_challenge/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ipf_flutter_starter_pack/ipf_flutter_starter_pack.dart';

class TaskStatisticsBar extends ConsumerWidget {
  const TaskStatisticsBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TaskModel> tasks = ref.watch(tasksProvider).tasks;
    int totalTasks = tasks.length;
    int completedTasks = tasks.where((task) => task.status == TaskStatus.done.value).length;
    double progress = totalTasks > 0 ? completedTasks.toDouble() / totalTasks.toDouble() : 0.0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.colorScheme.outline.withAlpha(25)),
      ),
      child: Row(
        children: [
          _StatItem(icon: Icons.task_outlined, value: totalTasks.toString(), label: 'Total Tasks', color: context.colorScheme.primary),
          const SizedBox(width: 24),
          _StatItem(icon: Icons.check_circle_outline, value: completedTasks.toString(), label: 'Completed', color: Colors.green),
          const SizedBox(width: 24),
          Expanded(child: _ProgressIndicator(progress: progress)),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _StatItem({required this.icon, required this.value, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: color),
            const SizedBox(width: 6),
            Text(value, style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
          ],
        ),
        const SizedBox(height: 2),
        Text(label, style: context.textTheme.labelSmall?.copyWith(color: context.colorScheme.onSurfaceVariant)),
      ],
    );
  }
}

class _ProgressIndicator extends StatelessWidget {
  final double progress;

  const _ProgressIndicator({required this.progress});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Progress', style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant)),
            Text(
              '${(progress * 100).round()}%',
              style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600, color: context.colorScheme.primary),
            ),
          ],
        ),
        const SizedBox(height: 4),
        LinearProgressIndicator(
          value: double.tryParse(progress.toStringAsFixed(2)) ?? 0,
          backgroundColor: context.colorScheme.outline.withAlpha(25),
          color: context.colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
          minHeight: 8,
        ),
      ],
    );
  }
}
