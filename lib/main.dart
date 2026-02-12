import 'package:code_challenge/core/theme/app_theme.dart';
import 'package:code_challenge/generated/l10n.dart';
import 'package:code_challenge/root/splash_screen.dart';
import 'package:code_challenge/services/localization_service.dart';
import 'package:code_challenge/shared/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(settingsProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'code_challenge',
      locale: provider.language.locale,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: Strings.supportedLocales,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: provider.themeMode,
      home: const SplashScreen(),
    );
    ;
  }
}
