// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(language) => "Language changed to ${language}";

  static String m1(dataType) => "Failed to delete ${dataType}:";

  static String m2(dataType) => "Failed to load ${dataType}:";

  static String m3(dataType) => "Failed to save ${dataType}:";

  static String m4(dataType) => "Failed to update ${dataType}:";

  static String m5(version) => "Version ${version}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "active": MessageLookupByLibrary.simpleMessage("ACTIVE"),
    "addTask": MessageLookupByLibrary.simpleMessage("Add Task"),
    "all": MessageLookupByLibrary.simpleMessage("All"),
    "appearance": MessageLookupByLibrary.simpleMessage("Appearance"),
    "board": MessageLookupByLibrary.simpleMessage("Board"),
    "boardName": MessageLookupByLibrary.simpleMessage("Board Name *"),
    "boardNameIsRequired": MessageLookupByLibrary.simpleMessage(
      "Board name is required",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "changeLanguageMessage": m0,
    "clearDatabase": MessageLookupByLibrary.simpleMessage("Clear Database"),
    "clearDatabaseMessage": MessageLookupByLibrary.simpleMessage(
      "This will delete all boards and tasks. This action cannot be undone. Are you sure?",
    ),
    "clearFilter": MessageLookupByLibrary.simpleMessage("Clear Filter"),
    "completed": MessageLookupByLibrary.simpleMessage("Completed"),
    "createBoard": MessageLookupByLibrary.simpleMessage("Create Board"),
    "createBoardMessage": MessageLookupByLibrary.simpleMessage(
      "Create your first board to get started",
    ),
    "darkMode": MessageLookupByLibrary.simpleMessage("Dark Mode"),
    "dataManagement": MessageLookupByLibrary.simpleMessage("Data Management"),
    "databaseCleared": MessageLookupByLibrary.simpleMessage(
      "Database cleared successfully",
    ),
    "databasePopulated": MessageLookupByLibrary.simpleMessage(
      "Database populated successfully",
    ),
    "dayAgo": MessageLookupByLibrary.simpleMessage("d ago"),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "deleteTask": MessageLookupByLibrary.simpleMessage("Delete Task"),
    "deleteTaskQuestion": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this task?",
    ),
    "description": MessageLookupByLibrary.simpleMessage("Description"),
    "descriptionHint": MessageLookupByLibrary.simpleMessage(
      "Add description (optional)",
    ),
    "dismiss": MessageLookupByLibrary.simpleMessage("Dismiss"),
    "done": MessageLookupByLibrary.simpleMessage("DONE"),
    "doneStatus": MessageLookupByLibrary.simpleMessage("Done"),
    "edit": MessageLookupByLibrary.simpleMessage("Edit"),
    "editBoard": MessageLookupByLibrary.simpleMessage("Edit Board"),
    "editTask": MessageLookupByLibrary.simpleMessage("Edit Task"),
    "failedToChangeLanguage": MessageLookupByLibrary.simpleMessage(
      "Failed to change language",
    ),
    "failedToChangeTheme": MessageLookupByLibrary.simpleMessage(
      "Failed to change theme",
    ),
    "failedToClearDatabase": MessageLookupByLibrary.simpleMessage(
      "Failed to clear database",
    ),
    "failedToDeleteData": m1,
    "failedToLoadData": m2,
    "failedToLoadSettings": MessageLookupByLibrary.simpleMessage(
      "Failed to load settings",
    ),
    "failedToPopulateDatabase": MessageLookupByLibrary.simpleMessage(
      "Failed to populate database",
    ),
    "failedToResetSettings": MessageLookupByLibrary.simpleMessage(
      "Failed to reset settings",
    ),
    "failedToSaveData": m3,
    "failedToUpdateData": m4,
    "filterByStatus": MessageLookupByLibrary.simpleMessage(
      "Filter by Task Status",
    ),
    "high": MessageLookupByLibrary.simpleMessage("High"),
    "hourAgo": MessageLookupByLibrary.simpleMessage("h ago"),
    "inProgress": MessageLookupByLibrary.simpleMessage("In Progress"),
    "justNow": MessageLookupByLibrary.simpleMessage("Just now"),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "lightMode": MessageLookupByLibrary.simpleMessage("Light Mode"),
    "low": MessageLookupByLibrary.simpleMessage("Low"),
    "medium": MessageLookupByLibrary.simpleMessage("Medium"),
    "minuteAgo": MessageLookupByLibrary.simpleMessage("m ago"),
    "noBoardsYet": MessageLookupByLibrary.simpleMessage("No boards yet"),
    "noResultsFound": MessageLookupByLibrary.simpleMessage("No results found"),
    "populateDatabase": MessageLookupByLibrary.simpleMessage(
      "Populate Database",
    ),
    "populateDatabaseMessage": MessageLookupByLibrary.simpleMessage(
      "This will add sample data to your database. Are you sure?",
    ),
    "priority": MessageLookupByLibrary.simpleMessage("Priority"),
    "progress": MessageLookupByLibrary.simpleMessage("Progress"),
    "reset": MessageLookupByLibrary.simpleMessage("Reset"),
    "resetSettings": MessageLookupByLibrary.simpleMessage("Reset Settings"),
    "resetSettingsMessage": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to reset all settings to default?",
    ),
    "results": MessageLookupByLibrary.simpleMessage("Results"),
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "searchHint": MessageLookupByLibrary.simpleMessage(
      "Search boards or tasks...",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "settingsResetToDefault": MessageLookupByLibrary.simpleMessage(
      "Settings reset to default",
    ),
    "status": MessageLookupByLibrary.simpleMessage("Status"),
    "systemMode": MessageLookupByLibrary.simpleMessage("System Mode"),
    "task": MessageLookupByLibrary.simpleMessage("Task"),
    "taskBoards": MessageLookupByLibrary.simpleMessage("Task Boards"),
    "taskPriority": MessageLookupByLibrary.simpleMessage("Task Priority"),
    "taskStatus": MessageLookupByLibrary.simpleMessage("Task Status"),
    "taskTittle": MessageLookupByLibrary.simpleMessage("Task title *"),
    "tasks": MessageLookupByLibrary.simpleMessage("Tasks"),
    "themeMode": MessageLookupByLibrary.simpleMessage("Theme Mode"),
    "themeModeMessage": MessageLookupByLibrary.simpleMessage(
      "Choose your preferred theme appearance",
    ),
    "titleRequired": MessageLookupByLibrary.simpleMessage("Title is required"),
    "toDo": MessageLookupByLibrary.simpleMessage("To Do"),
    "total": MessageLookupByLibrary.simpleMessage("TOTAL"),
    "totalTasks": MessageLookupByLibrary.simpleMessage("Total Tasks"),
    "version": m5,
    "yourBoards": MessageLookupByLibrary.simpleMessage("Your Boards"),
  };
}
