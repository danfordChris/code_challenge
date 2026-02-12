// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Task Boards`
  String get taskBoards {
    return Intl.message('Task Boards', name: 'taskBoards', desc: '', args: []);
  }

  /// `ACTIVE`
  String get active {
    return Intl.message('ACTIVE', name: 'active', desc: '', args: []);
  }

  /// `TOTAL`
  String get total {
    return Intl.message('TOTAL', name: 'total', desc: '', args: []);
  }

  /// `DONE`
  String get done {
    return Intl.message('DONE', name: 'done', desc: '', args: []);
  }

  /// `Your Boards`
  String get yourBoards {
    return Intl.message('Your Boards', name: 'yourBoards', desc: '', args: []);
  }

  /// `No boards yet`
  String get noBoardsYet {
    return Intl.message(
      'No boards yet',
      name: 'noBoardsYet',
      desc: '',
      args: [],
    );
  }

  /// `Create your first board to get started`
  String get createBoardMessage {
    return Intl.message(
      'Create your first board to get started',
      name: 'createBoardMessage',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load {dataType}:`
  String failedToLoadData(Object dataType) {
    return Intl.message(
      'Failed to load $dataType:',
      name: 'failedToLoadData',
      desc: '',
      args: [dataType],
    );
  }

  /// `Failed to save {dataType}:`
  String failedToSaveData(Object dataType) {
    return Intl.message(
      'Failed to save $dataType:',
      name: 'failedToSaveData',
      desc: '',
      args: [dataType],
    );
  }

  /// `Failed to delete {dataType}:`
  String failedToDeleteData(Object dataType) {
    return Intl.message(
      'Failed to delete $dataType:',
      name: 'failedToDeleteData',
      desc: '',
      args: [dataType],
    );
  }

  /// `Failed to update {dataType}:`
  String failedToUpdateData(Object dataType) {
    return Intl.message(
      'Failed to update $dataType:',
      name: 'failedToUpdateData',
      desc: '',
      args: [dataType],
    );
  }

  /// `Task`
  String get task {
    return Intl.message('Task', name: 'task', desc: '', args: []);
  }

  /// `Board`
  String get board {
    return Intl.message('Board', name: 'board', desc: '', args: []);
  }

  /// `To Do`
  String get toDo {
    return Intl.message('To Do', name: 'toDo', desc: '', args: []);
  }

  /// `In Progress`
  String get inProgress {
    return Intl.message('In Progress', name: 'inProgress', desc: '', args: []);
  }

  /// `Done`
  String get doneStatus {
    return Intl.message('Done', name: 'doneStatus', desc: '', args: []);
  }

  /// `Add Task`
  String get addTask {
    return Intl.message('Add Task', name: 'addTask', desc: '', args: []);
  }

  /// `Edit Task`
  String get editTask {
    return Intl.message('Edit Task', name: 'editTask', desc: '', args: []);
  }

  /// `Delete Task`
  String get deleteTask {
    return Intl.message('Delete Task', name: 'deleteTask', desc: '', args: []);
  }

  /// `High`
  String get high {
    return Intl.message('High', name: 'high', desc: '', args: []);
  }

  /// `Medium`
  String get medium {
    return Intl.message('Medium', name: 'medium', desc: '', args: []);
  }

  /// `Low`
  String get low {
    return Intl.message('Low', name: 'low', desc: '', args: []);
  }

  /// `Progress`
  String get progress {
    return Intl.message('Progress', name: 'progress', desc: '', args: []);
  }

  /// `Total Tasks`
  String get totalTasks {
    return Intl.message('Total Tasks', name: 'totalTasks', desc: '', args: []);
  }

  /// `Completed`
  String get completed {
    return Intl.message('Completed', name: 'completed', desc: '', args: []);
  }

  /// `Are you sure you want to delete this task?`
  String get deleteTaskQuestion {
    return Intl.message(
      'Are you sure you want to delete this task?',
      name: 'deleteTaskQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Title is required`
  String get titleRequired {
    return Intl.message(
      'Title is required',
      name: 'titleRequired',
      desc: '',
      args: [],
    );
  }

  /// `Edit Board`
  String get editBoard {
    return Intl.message('Edit Board', name: 'editBoard', desc: '', args: []);
  }

  /// `Task title *`
  String get taskTittle {
    return Intl.message('Task title *', name: 'taskTittle', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Add description (optional)`
  String get descriptionHint {
    return Intl.message(
      'Add description (optional)',
      name: 'descriptionHint',
      desc: '',
      args: [],
    );
  }

  /// `Priority`
  String get priority {
    return Intl.message('Priority', name: 'priority', desc: '', args: []);
  }

  /// `Task Priority`
  String get taskPriority {
    return Intl.message(
      'Task Priority',
      name: 'taskPriority',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message('Status', name: 'status', desc: '', args: []);
  }

  /// `Task Status`
  String get taskStatus {
    return Intl.message('Task Status', name: 'taskStatus', desc: '', args: []);
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Board name is required`
  String get boardNameIsRequired {
    return Intl.message(
      'Board name is required',
      name: 'boardNameIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Create Board`
  String get createBoard {
    return Intl.message(
      'Create Board',
      name: 'createBoard',
      desc: '',
      args: [],
    );
  }

  /// `Board Name *`
  String get boardName {
    return Intl.message('Board Name *', name: 'boardName', desc: '', args: []);
  }

  /// `d ago`
  String get dayAgo {
    return Intl.message('d ago', name: 'dayAgo', desc: '', args: []);
  }

  /// `h ago`
  String get hourAgo {
    return Intl.message('h ago', name: 'hourAgo', desc: '', args: []);
  }

  /// `m ago`
  String get minuteAgo {
    return Intl.message('m ago', name: 'minuteAgo', desc: '', args: []);
  }

  /// `Just now`
  String get justNow {
    return Intl.message('Just now', name: 'justNow', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Tasks`
  String get tasks {
    return Intl.message('Tasks', name: 'tasks', desc: '', args: []);
  }

  /// `Dismiss`
  String get dismiss {
    return Intl.message('Dismiss', name: 'dismiss', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Reset Settings`
  String get resetSettings {
    return Intl.message(
      'Reset Settings',
      name: 'resetSettings',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to reset all settings to default?`
  String get resetSettingsMessage {
    return Intl.message(
      'Are you sure you want to reset all settings to default?',
      name: 'resetSettingsMessage',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message('Reset', name: 'reset', desc: '', args: []);
  }

  /// `Settings reset to default`
  String get settingsResetToDefault {
    return Intl.message(
      'Settings reset to default',
      name: 'settingsResetToDefault',
      desc: '',
      args: [],
    );
  }

  /// `Appearance`
  String get appearance {
    return Intl.message('Appearance', name: 'appearance', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Version {version}`
  String version(Object version) {
    return Intl.message(
      'Version $version',
      name: 'version',
      desc: '',
      args: [version],
    );
  }

  /// `Language changed to {language}`
  String changeLanguageMessage(Object language) {
    return Intl.message(
      'Language changed to $language',
      name: 'changeLanguageMessage',
      desc: '',
      args: [language],
    );
  }

  /// `Theme Mode`
  String get themeMode {
    return Intl.message('Theme Mode', name: 'themeMode', desc: '', args: []);
  }

  /// `Choose your preferred theme appearance`
  String get themeModeMessage {
    return Intl.message(
      'Choose your preferred theme appearance',
      name: 'themeModeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `Light Mode`
  String get lightMode {
    return Intl.message('Light Mode', name: 'lightMode', desc: '', args: []);
  }

  /// `System Mode`
  String get systemMode {
    return Intl.message('System Mode', name: 'systemMode', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'sw'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
