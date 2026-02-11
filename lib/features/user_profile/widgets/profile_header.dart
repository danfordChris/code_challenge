import 'package:code_challenge/core/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String initials;
  final String name;
  final String email;

  const ProfileHeader({super.key, required this.initials, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.colorScheme.outline.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [context.colorScheme.primary, context.colorScheme.primary.withOpacity(0.8)]),
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: context.colorScheme.primary.withOpacity(0.3), blurRadius: 12, offset: const Offset(0, 4))],
            ),
            child: Center(
              child: Text(
                initials,
                style: context.textTheme.headlineMedium?.copyWith(color: context.colorScheme.onPrimary, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(name, style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text(email, style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.onSurfaceVariant)),
        ],
      ),
    );
  }
}
