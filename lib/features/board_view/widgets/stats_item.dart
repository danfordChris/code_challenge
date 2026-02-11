import 'package:code_challenge/core/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

class StatsItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const StatsItem({super.key, required this.icon, required this.value, required this.label, required this.color});

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
