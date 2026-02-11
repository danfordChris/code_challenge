import 'package:code_challenge/core/extensions/build_context_extensions.dart';
import 'package:code_challenge/shared/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageOptions extends ConsumerStatefulWidget {
  const LanguageOptions({super.key});

  @override
  ConsumerState<LanguageOptions> createState() => _LanguageOptionsState();
}

class _LanguageOptionsState extends ConsumerState<LanguageOptions> {
  @override
  Widget build(BuildContext context) {
    final settingsState = ref.watch(settingsProvider);
    final currentLanguage = settingsState.language;
    final isLoading = settingsState.isLoading;

    return Column(
      children: [
        if (isLoading)
          const Center(
            child: Padding(padding: EdgeInsets.all(16), child: CircularProgressIndicator()),
          )
        else
          ...Language.values.map((lang) {
            final isSelected = currentLanguage == lang;

            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: isSelected ? context.colorScheme.primary.withOpacity(0.05) : null,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: context.colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: context.colorScheme.outline.withOpacity(0.1)),
                  ),
                  child: Center(child: Text(lang.flag, style: const TextStyle(fontSize: 24))),
                ),
                title: Text(lang.label, style: context.textTheme.bodyMedium?.copyWith(fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal)),
                subtitle: Text(lang.nativeName, style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant)),
                trailing: isSelected
                    ? Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(color: context.colorScheme.primary, shape: BoxShape.circle),
                        child: const Icon(Icons.check, color: Colors.white, size: 16),
                      )
                    : null,
                onTap: () async {
                  await ref.read(settingsProvider.notifier).changeLanguage(lang);

                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Language changed to ${lang.label}'),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        margin: const EdgeInsets.all(16),
                      ),
                    );
                  }
                },
              ),
            );
          }).toList(),
      ],
    );
  }
}
