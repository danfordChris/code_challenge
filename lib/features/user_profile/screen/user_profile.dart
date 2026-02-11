import 'package:code_challenge/core/extensions/build_context_extensions.dart';
import 'package:code_challenge/features/user_profile/widgets/language_options.dart';
import 'package:code_challenge/features/user_profile/widgets/profile_header.dart';
import 'package:code_challenge/features/user_profile/widgets/section_header.dart';
import 'package:code_challenge/features/user_profile/widgets/settings_card.dart';
import 'package:code_challenge/features/user_profile/widgets/theme_options.dart';
import 'package:code_challenge/shared/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

class UserProfileScreen extends ConsumerStatefulWidget {
  const UserProfileScreen({super.key});

  @override
  ConsumerState<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends ConsumerState<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final settingsState = ref.watch(settingsProvider);
    final error = settingsState.error;

    // Show error snackbar if there's an error
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (error != null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
            action: SnackBarAction(label: 'Dismiss', textColor: Colors.white, onPressed: () => ref.read(settingsProvider.notifier).clearError()),
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        elevation: 0,
        actions: [
          IconButton(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedDashboardSquareSetting, size: 20, color: context.colorScheme.onSurface),
            onPressed: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Reset Settings'),
                  content: const Text('Are you sure you want to reset all settings to default?'),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
                    TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Reset')),
                  ],
                ),
              );

              if (confirm == true) {
                await ref.read(settingsProvider.notifier).resetToDefaults();
                if (mounted) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('Settings reset to default'), behavior: SnackBarBehavior.floating));
                }
              }
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          // Profile Header
          ProfileHeader(initials: 'JD', name: 'John Doe', email: 'john.doe@example.com'),

          SizedBox(height: 24),

          // Theme Section
          SectionHeader(title: 'Appearance', icon: HugeIcons.strokeRoundedPaintBoard),
          SizedBox(height: 16),
          SettingsCard(children: [ThemeOptions()]),

          SizedBox(height: 24),

          // Language Section
          SectionHeader(title: 'Language', icon: HugeIcons.strokeRoundedTranslate),
          SizedBox(height: 16),
          SettingsCard(children: [LanguageOptions()]),

          SizedBox(height: 24),

          // App Info
          _AppInfo(),
        ],
      ),
    );
  }
}

class _AppInfo extends StatelessWidget {
  const _AppInfo();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Version 1.0.0', style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant)),
          const SizedBox(height: 4),
          Text('© 2026 code challenge', style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant)),
        ],
      ),
    );
  }
}
