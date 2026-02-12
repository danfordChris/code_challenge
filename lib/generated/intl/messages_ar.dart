// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
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
  String get localeName => 'ar';

  static String m0(language) => "تم تغيير اللغة إلى ${language}";

  static String m1(dataType) => "فشل حذف ${dataType}:";

  static String m2(dataType) => "فشل تحميل ${dataType}:";

  static String m3(dataType) => "فشل حفظ ${dataType}:";

  static String m4(dataType) => "فشل تحديث ${dataType}:";

  static String m5(version) => "الإصدار ${version}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "active": MessageLookupByLibrary.simpleMessage("نشط"),
    "addTask": MessageLookupByLibrary.simpleMessage("إضافة مهمة"),
    "all": MessageLookupByLibrary.simpleMessage("الكل"),
    "appearance": MessageLookupByLibrary.simpleMessage("المظهر"),
    "board": MessageLookupByLibrary.simpleMessage("لوحة"),
    "boardName": MessageLookupByLibrary.simpleMessage("اسم اللوحة *"),
    "boardNameIsRequired": MessageLookupByLibrary.simpleMessage(
      "اسم اللوحة مطلوب",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
    "changeLanguageMessage": m0,
    "clearDatabase": MessageLookupByLibrary.simpleMessage("مسح قاعدة البيانات"),
    "clearDatabaseMessage": MessageLookupByLibrary.simpleMessage(
      "سيؤدي هذا إلى حذف جميع اللوحات والمهام. لا يمكن التراجع عن هذا الإجراء. هل أنت متأكد؟",
    ),
    "clearFilter": MessageLookupByLibrary.simpleMessage("مسح التصفية"),
    "completed": MessageLookupByLibrary.simpleMessage("مكتملة"),
    "createBoard": MessageLookupByLibrary.simpleMessage("إنشاء لوحة"),
    "createBoardMessage": MessageLookupByLibrary.simpleMessage(
      "أنشئ لوحتك الأولى للبدء",
    ),
    "darkMode": MessageLookupByLibrary.simpleMessage("الوضع الداكن"),
    "dataExported": MessageLookupByLibrary.simpleMessage(
      "تم تصدير البيانات بنجاح",
    ),
    "dataImportedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "تم استيراد البيانات بنجاح",
    ),
    "dataManagement": MessageLookupByLibrary.simpleMessage("إدارة البيانات"),
    "databaseCleared": MessageLookupByLibrary.simpleMessage(
      "تم مسح قاعدة البيانات بنجاح",
    ),
    "databasePopulated": MessageLookupByLibrary.simpleMessage(
      "تم تعبئة قاعدة البيانات بنجاح",
    ),
    "dayAgo": MessageLookupByLibrary.simpleMessage("ي"),
    "delete": MessageLookupByLibrary.simpleMessage("حذف"),
    "deleteTask": MessageLookupByLibrary.simpleMessage("حذف المهمة"),
    "deleteTaskQuestion": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد أنك تريد حذف هذه المهمة؟",
    ),
    "description": MessageLookupByLibrary.simpleMessage("الوصف"),
    "descriptionHint": MessageLookupByLibrary.simpleMessage(
      "إضافة وصف (اختياري)",
    ),
    "dismiss": MessageLookupByLibrary.simpleMessage("تجاهل"),
    "done": MessageLookupByLibrary.simpleMessage("تم"),
    "doneStatus": MessageLookupByLibrary.simpleMessage("مكتمل"),
    "edit": MessageLookupByLibrary.simpleMessage("تعديل"),
    "editBoard": MessageLookupByLibrary.simpleMessage("تعديل اللوحة"),
    "editTask": MessageLookupByLibrary.simpleMessage("تعديل المهمة"),
    "exportData": MessageLookupByLibrary.simpleMessage("تصدير البيانات"),
    "exportDataMessage": MessageLookupByLibrary.simpleMessage(
      "سيؤدي هذا إلى تصدير لوحاتك ومهامك إلى ملف JSON. هل أنت متأكد؟",
    ),
    "failedToChangeLanguage": MessageLookupByLibrary.simpleMessage(
      "فشل تغيير اللغة",
    ),
    "failedToChangeTheme": MessageLookupByLibrary.simpleMessage(
      "فشل تغيير السمة",
    ),
    "failedToClearDatabase": MessageLookupByLibrary.simpleMessage(
      "فشل مسح قاعدة البيانات",
    ),
    "failedToDeleteData": m1,
    "failedToExportData": MessageLookupByLibrary.simpleMessage(
      "فشل تصدير البيانات",
    ),
    "failedToImportData": MessageLookupByLibrary.simpleMessage(
      "فشل استيراد البيانات",
    ),
    "failedToLoadData": m2,
    "failedToLoadSettings": MessageLookupByLibrary.simpleMessage(
      "فشل تحميل الإعدادات",
    ),
    "failedToPopulateDatabase": MessageLookupByLibrary.simpleMessage(
      "فشل تعبئة قاعدة البيانات",
    ),
    "failedToResetSettings": MessageLookupByLibrary.simpleMessage(
      "فشل إعادة ضبط الإعدادات",
    ),
    "failedToSaveData": m3,
    "failedToUpdateData": m4,
    "filterByStatus": MessageLookupByLibrary.simpleMessage(
      "تصفية حسب حالة المهمة",
    ),
    "high": MessageLookupByLibrary.simpleMessage("عالية"),
    "hourAgo": MessageLookupByLibrary.simpleMessage("س"),
    "importData": MessageLookupByLibrary.simpleMessage("استيراد البيانات"),
    "importDataMessage": MessageLookupByLibrary.simpleMessage(
      "سيؤدي هذا إلى استيراد اللوحات والمهام من ملف JSON. قد يؤدي ذلك إلى استبدال البيانات الموجودة. هل أنت متأكد؟",
    ),
    "inProgress": MessageLookupByLibrary.simpleMessage("قيد التنفيذ"),
    "justNow": MessageLookupByLibrary.simpleMessage("الآن"),
    "language": MessageLookupByLibrary.simpleMessage("اللغة"),
    "lightMode": MessageLookupByLibrary.simpleMessage("الوضع الفاتح"),
    "low": MessageLookupByLibrary.simpleMessage("منخفضة"),
    "medium": MessageLookupByLibrary.simpleMessage("متوسطة"),
    "minuteAgo": MessageLookupByLibrary.simpleMessage("د"),
    "noBoardsYet": MessageLookupByLibrary.simpleMessage("لا توجد لوحات بعد"),
    "noResultsFound": MessageLookupByLibrary.simpleMessage(
      "لم يتم العثور على نتائج",
    ),
    "populateDatabase": MessageLookupByLibrary.simpleMessage(
      "تعبئة قاعدة البيانات",
    ),
    "populateDatabaseMessage": MessageLookupByLibrary.simpleMessage(
      "سيؤدي هذا إلى إضافة بيانات نموذجية إلى قاعدة البيانات الخاصة بك. هل أنت متأكد؟",
    ),
    "priority": MessageLookupByLibrary.simpleMessage("الأولوية"),
    "progress": MessageLookupByLibrary.simpleMessage("التقدم"),
    "reset": MessageLookupByLibrary.simpleMessage("إعادة ضبط"),
    "resetSettings": MessageLookupByLibrary.simpleMessage(
      "إعادة ضبط الإعدادات",
    ),
    "resetSettingsMessage": MessageLookupByLibrary.simpleMessage(
      "هل أنت متأكد أنك تريد إعادة ضبط جميع الإعدادات إلى الافتراضية؟",
    ),
    "results": MessageLookupByLibrary.simpleMessage("النتائج"),
    "save": MessageLookupByLibrary.simpleMessage("حفظ"),
    "searchHint": MessageLookupByLibrary.simpleMessage(
      "ابحث في اللوحات أو المهام...",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("الإعدادات"),
    "settingsResetToDefault": MessageLookupByLibrary.simpleMessage(
      "تمت إعادة ضبط الإعدادات إلى الافتراضية",
    ),
    "status": MessageLookupByLibrary.simpleMessage("الحالة"),
    "systemMode": MessageLookupByLibrary.simpleMessage("وضع النظام"),
    "task": MessageLookupByLibrary.simpleMessage("مهمة"),
    "taskBoards": MessageLookupByLibrary.simpleMessage("لوحات المهام"),
    "taskPriority": MessageLookupByLibrary.simpleMessage("أولوية المهمة"),
    "taskStatus": MessageLookupByLibrary.simpleMessage("حالة المهمة"),
    "taskTittle": MessageLookupByLibrary.simpleMessage("عنوان المهمة *"),
    "tasks": MessageLookupByLibrary.simpleMessage("المهام"),
    "themeMode": MessageLookupByLibrary.simpleMessage("وضع السمة"),
    "themeModeMessage": MessageLookupByLibrary.simpleMessage(
      "اختر مظهر السمة المفضل لديك",
    ),
    "titleRequired": MessageLookupByLibrary.simpleMessage("العنوان مطلوب"),
    "toDo": MessageLookupByLibrary.simpleMessage("للقيام"),
    "total": MessageLookupByLibrary.simpleMessage("الإجمالي"),
    "totalTasks": MessageLookupByLibrary.simpleMessage("إجمالي المهام"),
    "version": m5,
    "yourBoards": MessageLookupByLibrary.simpleMessage("لوحاتك"),
  };
}
