import 'package:code_challenge/core/extensions/build_context_extensions.dart';
import 'package:code_challenge/services/localization_service.dart';
import 'package:code_challenge/shared/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

enum AppTheme { light, dark, system }

class ThemeOptions extends ConsumerStatefulWidget {
  const ThemeOptions({super.key});

  @override
  ConsumerState<ThemeOptions> createState() => _ThemeOptionsState();
}

class _ThemeOptionsState extends ConsumerState<ThemeOptions> {
  @override
  Widget build(BuildContext context) {
    final settingsState = ref.watch(settingsProvider);
    final currentTheme = _mapThemeModeToAppTheme(settingsState.themeMode);
    final isLoading = settingsState.isLoading;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(Strings.instance.themeMode, style: TextStyle(fontWeight: FontWeight.w600)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(Strings.instance.themeModeMessage, style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant)),
        ),
        const SizedBox(height: 16),
        if (isLoading)
          const Center(
            child: Padding(padding: EdgeInsets.all(16), child: CircularProgressIndicator()),
          )
        else
          Row(
            children: [
              Expanded(
                child: _ThemeOption(
                  theme: AppTheme.light,
                  currentTheme: currentTheme,
                  icon: HugeIcons.strokeRoundedSun01,
                  label: Strings.instance.lightMode,
                  onTap: () => ref.read(settingsProvider.notifier).setLightMode(),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _ThemeOption(
                  theme: AppTheme.dark,
                  currentTheme: currentTheme,
                  icon: HugeIcons.strokeRoundedMoon01,
                  label: Strings.instance.darkMode,
                  onTap: () => ref.read(settingsProvider.notifier).setDarkMode(),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _ThemeOption(
                  theme: AppTheme.system,
                  currentTheme: currentTheme,
                  icon: HugeIcons.strokeRoundedSettings01,
                  label: Strings.instance.systemMode,
                  onTap: () => ref.read(settingsProvider.notifier).setSystemMode(),
                ),
              ),
            ],
          ),
        const SizedBox(height: 16),
      ],
    );
  }

  AppTheme _mapThemeModeToAppTheme(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.dark:
        return AppTheme.dark;
      case ThemeMode.light:
        return AppTheme.light;
      case ThemeMode.system:
        return AppTheme.system;
    }
  }
}

class _ThemeOption extends StatelessWidget {
  final AppTheme theme;
  final AppTheme currentTheme;
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ThemeOption({required this.theme, required this.currentTheme, required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isSelected = theme == currentTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? context.colorScheme.primary.withOpacity(0.1) : context.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? context.colorScheme.primary : context.colorScheme.outline.withOpacity(0.2),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Icon(icon, color: isSelected ? context.colorScheme.primary : context.colorScheme.onSurfaceVariant, size: 24),
            const SizedBox(height: 8),
            Text(
              label,
              style: context.textTheme.labelMedium?.copyWith(
                color: isSelected ? context.colorScheme.primary : context.colorScheme.onSurfaceVariant,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            if (isSelected) ...[const SizedBox(height: 4), Icon(Icons.check_circle, color: context.colorScheme.primary, size: 16)],
          ],
        ),
      ),
    );
  }
}
