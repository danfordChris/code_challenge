// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a sw locale. All the
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
  String get localeName => 'sw';

  static String m0(language) => "Lugha imebadilishwa hadi ${language}";

  static String m1(dataType) => "Imeshindwa kufuta ${dataType}:";

  static String m2(dataType) => "Imeshindwa kupakia ${dataType}:";

  static String m3(dataType) => "Imeshindwa kuhifadhi ${dataType}:";

  static String m4(dataType) => "Imeshindwa kusasisha ${dataType}:";

  static String m5(version) => "Toleo ${version}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "active": MessageLookupByLibrary.simpleMessage("INAYOFANYA KAZI"),
    "addTask": MessageLookupByLibrary.simpleMessage("Ongeza Kazi"),
    "all": MessageLookupByLibrary.simpleMessage("Zote"),
    "appearance": MessageLookupByLibrary.simpleMessage("Mwonekano"),
    "board": MessageLookupByLibrary.simpleMessage("Mbao"),
    "boardName": MessageLookupByLibrary.simpleMessage("Jina la Mbao *"),
    "boardNameIsRequired": MessageLookupByLibrary.simpleMessage(
      "Jina la mbao linahitajika",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Ghairi"),
    "changeLanguageMessage": m0,
    "clearDatabase": MessageLookupByLibrary.simpleMessage("Futa Hifadhidata"),
    "clearDatabaseMessage": MessageLookupByLibrary.simpleMessage(
      "Hii itafuta mbao na kazi zote. Kitendo hiki hakiwezi kutenduliwa. Una uhakika?",
    ),
    "clearFilter": MessageLookupByLibrary.simpleMessage("Futa Kichujio"),
    "completed": MessageLookupByLibrary.simpleMessage("Imekamilika"),
    "createBoard": MessageLookupByLibrary.simpleMessage("Unda Mbao"),
    "createBoardMessage": MessageLookupByLibrary.simpleMessage(
      "Unda mbao yako ya kwanza kuanza",
    ),
    "darkMode": MessageLookupByLibrary.simpleMessage("Hali ya Giza"),
    "dataManagement": MessageLookupByLibrary.simpleMessage("Usimamizi wa Data"),
    "databaseCleared": MessageLookupByLibrary.simpleMessage(
      "Hifadhidata imefutwa kwa mafanikio",
    ),
    "databasePopulated": MessageLookupByLibrary.simpleMessage(
      "Hifadhidata imejazwa kwa mafanikio",
    ),
    "dayAgo": MessageLookupByLibrary.simpleMessage("s iliyopita"),
    "delete": MessageLookupByLibrary.simpleMessage("Futa"),
    "deleteTask": MessageLookupByLibrary.simpleMessage("Futa Kazi"),
    "deleteTaskQuestion": MessageLookupByLibrary.simpleMessage(
      "Una uhakika unataka kufuta kazi hii?",
    ),
    "description": MessageLookupByLibrary.simpleMessage("Maelezo"),
    "descriptionHint": MessageLookupByLibrary.simpleMessage(
      "Ongeza maelezo (si lazima)",
    ),
    "dismiss": MessageLookupByLibrary.simpleMessage("Ondoa"),
    "done": MessageLookupByLibrary.simpleMessage("IMEKWISHA"),
    "doneStatus": MessageLookupByLibrary.simpleMessage("Imekwisha"),
    "edit": MessageLookupByLibrary.simpleMessage("Hariri"),
    "editBoard": MessageLookupByLibrary.simpleMessage("Hariri Mbao"),
    "editTask": MessageLookupByLibrary.simpleMessage("Hariri Kazi"),
    "failedToChangeLanguage": MessageLookupByLibrary.simpleMessage(
      "Imeshindwa kubadilisha lugha",
    ),
    "failedToChangeTheme": MessageLookupByLibrary.simpleMessage(
      "Imeshindwa kubadilisha mandhari",
    ),
    "failedToClearDatabase": MessageLookupByLibrary.simpleMessage(
      "Imeshindwa kufuta hifadhidata",
    ),
    "failedToDeleteData": m1,
    "failedToLoadData": m2,
    "failedToLoadSettings": MessageLookupByLibrary.simpleMessage(
      "Imeshindwa kupakia mipangilio",
    ),
    "failedToPopulateDatabase": MessageLookupByLibrary.simpleMessage(
      "Imeshindwa kujaza hifadhidata",
    ),
    "failedToResetSettings": MessageLookupByLibrary.simpleMessage(
      "Imeshindwa kuweka upya mipangilio",
    ),
    "failedToSaveData": m3,
    "failedToUpdateData": m4,
    "filterByStatus": MessageLookupByLibrary.simpleMessage(
      "Chuja kwa Hali ya Kazi",
    ),
    "high": MessageLookupByLibrary.simpleMessage("Juu"),
    "hourAgo": MessageLookupByLibrary.simpleMessage("saa iliyopita"),
    "inProgress": MessageLookupByLibrary.simpleMessage("Inaendelea"),
    "justNow": MessageLookupByLibrary.simpleMessage("Sasa hivi"),
    "language": MessageLookupByLibrary.simpleMessage("Lugha"),
    "lightMode": MessageLookupByLibrary.simpleMessage("Hali ya Mwanga"),
    "low": MessageLookupByLibrary.simpleMessage("Chini"),
    "medium": MessageLookupByLibrary.simpleMessage("Kati"),
    "minuteAgo": MessageLookupByLibrary.simpleMessage("d iliyopita"),
    "noBoardsYet": MessageLookupByLibrary.simpleMessage("Hakuna mbao bado"),
    "noResultsFound": MessageLookupByLibrary.simpleMessage(
      "Hakuna matokeo yaliyopatikana",
    ),
    "populateDatabase": MessageLookupByLibrary.simpleMessage(
      "Jaza Hifadhidata",
    ),
    "populateDatabaseMessage": MessageLookupByLibrary.simpleMessage(
      "Hii itaongeza data ya mfano kwenye hifadhidata yako. Una uhakika?",
    ),
    "priority": MessageLookupByLibrary.simpleMessage("Kipaumbele"),
    "progress": MessageLookupByLibrary.simpleMessage("Maendeleo"),
    "reset": MessageLookupByLibrary.simpleMessage("Weka upya"),
    "resetSettings": MessageLookupByLibrary.simpleMessage(
      "Weka upya Mipangilio",
    ),
    "resetSettingsMessage": MessageLookupByLibrary.simpleMessage(
      "Una uhakika unataka kuweka upya mipangilio yote kwa chaguomsingi?",
    ),
    "results": MessageLookupByLibrary.simpleMessage("Matokeo"),
    "save": MessageLookupByLibrary.simpleMessage("Hifadhi"),
    "searchHint": MessageLookupByLibrary.simpleMessage(
      "Tafuta mbao au kazi...",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Mipangilio"),
    "settingsResetToDefault": MessageLookupByLibrary.simpleMessage(
      "Mipangilio imewekwa upya kwa chaguomsingi",
    ),
    "status": MessageLookupByLibrary.simpleMessage("Hali"),
    "systemMode": MessageLookupByLibrary.simpleMessage("Hali ya Mfumo"),
    "task": MessageLookupByLibrary.simpleMessage("Kazi"),
    "taskBoards": MessageLookupByLibrary.simpleMessage("Mbao za Kazi"),
    "taskPriority": MessageLookupByLibrary.simpleMessage("Kipaumbele cha Kazi"),
    "taskStatus": MessageLookupByLibrary.simpleMessage("Hali ya Kazi"),
    "taskTittle": MessageLookupByLibrary.simpleMessage("Jina la kazi *"),
    "tasks": MessageLookupByLibrary.simpleMessage("Kazi"),
    "themeMode": MessageLookupByLibrary.simpleMessage("Hali ya Mandhari"),
    "themeModeMessage": MessageLookupByLibrary.simpleMessage(
      "Chagua mwonekano wa mandhari unaoupendelea",
    ),
    "titleRequired": MessageLookupByLibrary.simpleMessage("Jina linahitajika"),
    "toDo": MessageLookupByLibrary.simpleMessage("Ya Kufanya"),
    "total": MessageLookupByLibrary.simpleMessage("JUMLA"),
    "totalTasks": MessageLookupByLibrary.simpleMessage("Jumla ya Kazi"),
    "version": m5,
    "yourBoards": MessageLookupByLibrary.simpleMessage("Mbao Zako"),
  };
}
