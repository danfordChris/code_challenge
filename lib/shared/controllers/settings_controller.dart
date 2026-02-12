import 'package:code_challenge/features/dashboard/controller/boards_controller.dart';
import 'package:code_challenge/models/boards_model.dart';
import 'package:code_challenge/models/task_model.dart';
import 'package:code_challenge/repositories/boards_repository.dart';
import 'package:code_challenge/repositories/task_repository.dart';
import 'package:code_challenge/services/localization_service.dart';
import 'package:code_challenge/services/preferences.dart';
import 'package:code_challenge/services/session_manager.dart';
import 'package:faker/faker.dart' as f;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Language {
  english('en', 'US', 'English', '🇺🇸', 'English'),
  swahili('sw', 'TZ', 'Swahili', '🇹🇿', 'Kiswahili'),
  spanish('es', 'ES', 'Spanish', '🇪🇸', 'Español'),
  french('fr', 'FR', 'French', '🇫🇷', 'Français'),
  arabic('ar', 'SA', 'Arabic', '🇸🇦', 'العربية');

  const Language(this.code, this.country, this.label, this.flag, this.nativeName);

  final String code;
  final String country;
  final String label;
  final String flag;
  final String nativeName;

  Locale get locale => Locale(code, country);

  static Language fromCode(String? code) {
    return Language.values.firstWhere((l) => l.code == code, orElse: () => Language.english);
  }

  static Language fromLocale(Locale locale) {
    return Language.values.firstWhere((l) => l.code == locale.languageCode, orElse: () => Language.english);
  }
}

class SettingsControllerState {
  final Language language;
  final ThemeMode themeMode;
  final bool isLoading;
  final String? error;

  const SettingsControllerState({required this.language, required this.themeMode, this.isLoading = false, this.error});

  // Initial state
  factory SettingsControllerState.initial() {
    return const SettingsControllerState(language: Language.english, themeMode: ThemeMode.system, isLoading: false);
  }

  SettingsControllerState copyWith({Language? language, ThemeMode? themeMode, bool? isLoading, String? error}) {
    return SettingsControllerState(
      language: language ?? this.language,
      themeMode: themeMode ?? this.themeMode,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  bool get isDarkMode => themeMode == ThemeMode.dark;
  bool get isLightMode => themeMode == ThemeMode.light;
  bool get isSystemMode => themeMode == ThemeMode.system;
}

class SettingsController extends Notifier<SettingsControllerState> {
  late final Preferences _preferences;
  late final SessionManager _sessionManager;

  @override
  SettingsControllerState build() {
    _preferences = Preferences.instance;
    _sessionManager = SessionManager.instance;
    _initialize();

    return SettingsControllerState.initial();
  }

  Future<void> _initialize() async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      final results = await Future.wait([_preferences.language, _preferences.darkMode]);
      final languageCode = results[0] as String?;
      final isDarkMode = results[1] as bool?;

      final currentLanguage = Language.fromCode(languageCode);
      _sessionManager.setLanguage(currentLanguage);

      final themeMode = _mapToThemeMode(isDarkMode);
      state = state.copyWith(language: currentLanguage, themeMode: themeMode, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: '${Strings.instance.failedToLoadSettings}: $e');
    }
  }

  Future<void> changeLanguage(Language language) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      state = state.copyWith(language: language);
      _sessionManager.setLanguage(language);
      _preferences.save(PrefKeys.language, language.code);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: '${Strings.instance.failedToChangeLanguage}: $e');
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      state = state.copyWith(themeMode: mode);
      final themeValue = _mapThemeModeToPreference(mode);
      _preferences.save(PrefKeys.darkMode, themeValue);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: '${Strings.instance.failedToChangeTheme}: $e');
    }
  }

  Future<void> setLightMode() => setThemeMode(ThemeMode.light);
  Future<void> setDarkMode() => setThemeMode(ThemeMode.dark);
  Future<void> setSystemMode() => setThemeMode(ThemeMode.system);

  Future<void> toggleTheme() {
    final newMode = state.isDarkMode ? ThemeMode.light : ThemeMode.dark;
    return setThemeMode(newMode);
  }

  Future<void> resetToDefaults() async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      _preferences.clearAll();
      final defaultLanguage = Language.english;
      final defaultTheme = ThemeMode.system;
      _sessionManager.setLanguage(defaultLanguage);
      state = state.copyWith(language: defaultLanguage, themeMode: defaultTheme, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: '${Strings.instance.failedToResetSettings}: $e');
    }
  }

  Future<void> clearDatabase() async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      final boards = await BoardsRepository.instance.all;
      for (var board in boards) {
        await BoardsRepository.instance.delete(board);
      }
      final tasks = await TaskRepository.instance.all;
      for (var task in tasks) {
        await TaskRepository.instance.delete(task);
      }
      state = state.copyWith(isLoading: false);
      ref.read(boardsProvider.notifier).loadBoards();
    } catch (e) {
      state = state.copyWith(isLoading: false, error: '${Strings.instance.failedToClearDatabase}: $e');
    }
  }

  Future<void> populateDatabase() async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      final faker = f.Faker();

      for (int i = 0; i < 5; i++) {
        final boardId = DateTime.now().millisecondsSinceEpoch.toString() + i.toString();
        final board = BoardsModel(
          id: boardId,
          boardName: faker.lorem.word().toUpperCase(),
          description: faker.lorem.sentence(),
          createdAt: DateTime.now().toString(),
          updatedAt: DateTime.now().toString(),
        );
        await BoardsRepository.instance.save(board);

        for (int j = 0; j < 10; j++) {
          final task = TaskModel(
            id: DateTime.now().millisecondsSinceEpoch.toString() + i.toString() + j.toString(),
            boardId: boardId,
            title: faker.lorem.sentence(),
            description: faker.lorem.sentence(),
            priority: faker.randomGenerator.integer(3, min: 1),
            status: faker.randomGenerator.integer(3, min: 1),
            createdAt: DateTime.now().toString(),
            updatedAt: DateTime.now().toString(),
          );
          await TaskRepository.instance.save(task);
        }
      }
      state = state.copyWith(isLoading: false);

      ref.read(boardsProvider.notifier).loadBoards();
    } catch (e) {
      state = state.copyWith(isLoading: false, error: '${Strings.instance.failedToPopulateDatabase}: $e');
    }
  }

  ThemeMode _mapToThemeMode(bool? isDarkMode) {
    if (isDarkMode == true) return ThemeMode.dark;
    if (isDarkMode == false) return ThemeMode.light;
    return ThemeMode.system;
  }

  bool? _mapThemeModeToPreference(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.dark:
        return true;
      case ThemeMode.light:
        return false;
      case ThemeMode.system:
        return null;
    }
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

// Provider
final settingsProvider = NotifierProvider<SettingsController, SettingsControllerState>(SettingsController.new);

//  Selectors
final settingsLanguageProvider = Provider<Language>((ref) {
  return ref.watch(settingsProvider.select((state) => state.language));
});

final settingsThemeModeProvider = Provider<ThemeMode>((ref) {
  return ref.watch(settingsProvider.select((state) => state.themeMode));
});

final settingsIsLoadingProvider = Provider<bool>((ref) {
  return ref.watch(settingsProvider.select((state) => state.isLoading));
});

final settingsErrorProvider = Provider<String?>((ref) {
  return ref.watch(settingsProvider.select((state) => state.error));
});
