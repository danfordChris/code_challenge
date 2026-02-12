import 'package:code_challenge/core/extensions/build_context_extensions.dart';
import 'package:code_challenge/features/user_profile/widgets/language_options.dart';
import 'package:code_challenge/features/user_profile/widgets/profile_header.dart';
import 'package:code_challenge/features/user_profile/widgets/section_header.dart';
import 'package:code_challenge/features/user_profile/widgets/settings_card.dart';
import 'package:code_challenge/features/user_profile/widgets/theme_options.dart';
import 'package:code_challenge/services/localization_service.dart';
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
            action: SnackBarAction(
              label: Strings.instance.dismiss,
              textColor: Colors.white,
              onPressed: () => ref.read(settingsProvider.notifier).clearError(),
            ),
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.instance.settings),
        elevation: 0,
        actions: [
          IconButton(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedDashboardSquareSetting, size: 20, color: context.colorScheme.onSurface),
            onPressed: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(Strings.instance.resetSettings),
                  content: Text(Strings.instance.resetSettingsMessage),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context, false), child: Text(Strings.instance.cancel)),
                    TextButton(onPressed: () => Navigator.pop(context, true), child: Text(Strings.instance.reset)),
                  ],
                ),
              );

              if (confirm == true) {
                await ref.read(settingsProvider.notifier).resetToDefaults();
                if (mounted) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(Strings.instance.settingsResetToDefault), behavior: SnackBarBehavior.floating));
                }
              }
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Profile Header
          const ProfileHeader(initials: 'JD', name: 'John Doe', email: 'john.doe@example.com'),

          const SizedBox(height: 24),

          // Theme Section
          SectionHeader(title: Strings.instance.appearance, icon: HugeIcons.strokeRoundedPaintBoard),
          const SizedBox(height: 16),
          const SettingsCard(children: [ThemeOptions()]),

          const SizedBox(height: 24),

          // Language Section
          SectionHeader(title: Strings.instance.language, icon: HugeIcons.strokeRoundedTranslate),
          const SizedBox(height: 16),
          const SettingsCard(children: [LanguageOptions()]),

          const SizedBox(height: 24),

          // Data Management Section
          SectionHeader(title: Strings.instance.dataManagement, icon: HugeIcons.strokeRoundedDatabase),
          const SizedBox(height: 16),
          SettingsCard(
            children: [
              ListTile(
                leading: const HugeIcon(icon: HugeIcons.strokeRoundedDatabaseImport, color: Colors.blue),
                title: Text(Strings.instance.populateDatabase),
                onTap: () async {
                  final confirm = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(Strings.instance.populateDatabase),
                      content: Text(Strings.instance.populateDatabaseMessage),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(context, false), child: Text(Strings.instance.cancel)),
                        TextButton(onPressed: () => Navigator.pop(context, true), child: Text(Strings.instance.populateDatabase)),
                      ],
                    ),
                  );

                  if (confirm == true) {
                    await ref.read(settingsProvider.notifier).populateDatabase();
                    if (mounted) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(Strings.instance.databasePopulated), behavior: SnackBarBehavior.floating));
                    }
                  }
                },
              ),
              const Divider(height: 1),
              ListTile(
                leading: const HugeIcon(icon: HugeIcons.strokeRoundedDatabaseSync, color: Colors.red),
                title: Text(Strings.instance.clearDatabase),
                onTap: () async {
                  final confirm = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(Strings.instance.clearDatabase),
                      content: Text(Strings.instance.clearDatabaseMessage),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(context, false), child: Text(Strings.instance.cancel)),
                        TextButton(onPressed: () => Navigator.pop(context, true), child: Text(Strings.instance.clearDatabase)),
                      ],
                    ),
                  );

                  if (confirm == true) {
                    await ref.read(settingsProvider.notifier).clearDatabase();
                    if (mounted) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(Strings.instance.databaseCleared), behavior: SnackBarBehavior.floating));
                    }
                  }
                },
              ),
            ],
          ),

          const SizedBox(height: 24),

          // App Info
          const _AppInfo(),
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
          Text(Strings.instance.version("1.0.0"), style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant)),
          const SizedBox(height: 4),
          Text('© 2026 code challenge', style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant)),
        ],
      ),
    );
  }
}
