import 'package:code_challenge/core/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  final List<Widget> children;

  const SettingsCard({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: context.colorScheme.outline.withOpacity(0.1)),
      ),
      child: Column(children: children),
    );
  }
}
