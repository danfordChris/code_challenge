// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  static String m0(language) => "Idioma cambiado a ${language}";

  static String m1(dataType) => "Error al eliminar ${dataType}:";

  static String m2(dataType) => "Error al cargar ${dataType}:";

  static String m3(dataType) => "Error al guardar ${dataType}:";

  static String m4(dataType) => "Error al actualizar ${dataType}:";

  static String m5(version) => "Versión ${version}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "active": MessageLookupByLibrary.simpleMessage("ACTIVO"),
    "addTask": MessageLookupByLibrary.simpleMessage("Agregar Tarea"),
    "all": MessageLookupByLibrary.simpleMessage("Todos"),
    "appearance": MessageLookupByLibrary.simpleMessage("Apariencia"),
    "board": MessageLookupByLibrary.simpleMessage("Tablero"),
    "boardName": MessageLookupByLibrary.simpleMessage("Nombre del Tablero *"),
    "boardNameIsRequired": MessageLookupByLibrary.simpleMessage(
      "El nombre del tablero es obligatorio",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
    "changeLanguageMessage": m0,
    "clearDatabase": MessageLookupByLibrary.simpleMessage(
      "Limpiar Base de Datos",
    ),
    "clearDatabaseMessage": MessageLookupByLibrary.simpleMessage(
      "Esto eliminará todos los tableros y tareas. Esta acción no se puede deshacer. ¿Estás seguro?",
    ),
    "clearFilter": MessageLookupByLibrary.simpleMessage("Limpiar Filtro"),
    "completed": MessageLookupByLibrary.simpleMessage("Completadas"),
    "createBoard": MessageLookupByLibrary.simpleMessage("Crear Tablero"),
    "createBoardMessage": MessageLookupByLibrary.simpleMessage(
      "Crea tu primer tablero para comenzar",
    ),
    "darkMode": MessageLookupByLibrary.simpleMessage("Modo Oscuro"),
    "dataManagement": MessageLookupByLibrary.simpleMessage("Gestión de Datos"),
    "databaseCleared": MessageLookupByLibrary.simpleMessage(
      "Base de datos limpiada exitosamente",
    ),
    "databasePopulated": MessageLookupByLibrary.simpleMessage(
      "Base de datos poblada exitosamente",
    ),
    "dayAgo": MessageLookupByLibrary.simpleMessage("d"),
    "delete": MessageLookupByLibrary.simpleMessage("Eliminar"),
    "deleteTask": MessageLookupByLibrary.simpleMessage("Eliminar Tarea"),
    "deleteTaskQuestion": MessageLookupByLibrary.simpleMessage(
      "¿Estás seguro de que quieres eliminar esta tarea?",
    ),
    "description": MessageLookupByLibrary.simpleMessage("Descripción"),
    "descriptionHint": MessageLookupByLibrary.simpleMessage(
      "Agregar descripción (opcional)",
    ),
    "dismiss": MessageLookupByLibrary.simpleMessage("Descartar"),
    "done": MessageLookupByLibrary.simpleMessage("HECHO"),
    "doneStatus": MessageLookupByLibrary.simpleMessage("Completado"),
    "edit": MessageLookupByLibrary.simpleMessage("Editar"),
    "editBoard": MessageLookupByLibrary.simpleMessage("Editar Tablero"),
    "editTask": MessageLookupByLibrary.simpleMessage("Editar Tarea"),
    "failedToChangeLanguage": MessageLookupByLibrary.simpleMessage(
      "Error al cambiar el idioma",
    ),
    "failedToChangeTheme": MessageLookupByLibrary.simpleMessage(
      "Error al cambiar el tema",
    ),
    "failedToClearDatabase": MessageLookupByLibrary.simpleMessage(
      "Error al limpiar la base de datos",
    ),
    "failedToDeleteData": m1,
    "failedToLoadData": m2,
    "failedToLoadSettings": MessageLookupByLibrary.simpleMessage(
      "Error al cargar la configuración",
    ),
    "failedToPopulateDatabase": MessageLookupByLibrary.simpleMessage(
      "Error al poblar la base de datos",
    ),
    "failedToResetSettings": MessageLookupByLibrary.simpleMessage(
      "Error al restablecer la configuración",
    ),
    "failedToSaveData": m3,
    "failedToUpdateData": m4,
    "filterByStatus": MessageLookupByLibrary.simpleMessage(
      "Filtrar por Estado de Tarea",
    ),
    "high": MessageLookupByLibrary.simpleMessage("Alta"),
    "hourAgo": MessageLookupByLibrary.simpleMessage("h"),
    "inProgress": MessageLookupByLibrary.simpleMessage("En Progreso"),
    "justNow": MessageLookupByLibrary.simpleMessage("Ahora mismo"),
    "language": MessageLookupByLibrary.simpleMessage("Idioma"),
    "lightMode": MessageLookupByLibrary.simpleMessage("Modo Claro"),
    "low": MessageLookupByLibrary.simpleMessage("Baja"),
    "medium": MessageLookupByLibrary.simpleMessage("Media"),
    "minuteAgo": MessageLookupByLibrary.simpleMessage("m"),
    "noBoardsYet": MessageLookupByLibrary.simpleMessage("Aún no hay tableros"),
    "noResultsFound": MessageLookupByLibrary.simpleMessage(
      "No se encontraron resultados",
    ),
    "populateDatabase": MessageLookupByLibrary.simpleMessage(
      "Poblar Base de Datos",
    ),
    "populateDatabaseMessage": MessageLookupByLibrary.simpleMessage(
      "Esto agregará datos de ejemplo a tu base de datos. ¿Estás seguro?",
    ),
    "priority": MessageLookupByLibrary.simpleMessage("Prioridad"),
    "progress": MessageLookupByLibrary.simpleMessage("Progreso"),
    "reset": MessageLookupByLibrary.simpleMessage("Restablecer"),
    "resetSettings": MessageLookupByLibrary.simpleMessage(
      "Restablecer Configuración",
    ),
    "resetSettingsMessage": MessageLookupByLibrary.simpleMessage(
      "¿Estás seguro de que quieres restablecer toda la configuración a los valores predeterminados?",
    ),
    "results": MessageLookupByLibrary.simpleMessage("Resultados"),
    "save": MessageLookupByLibrary.simpleMessage("Guardar"),
    "searchHint": MessageLookupByLibrary.simpleMessage(
      "Buscar tableros o tareas...",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Configuración"),
    "settingsResetToDefault": MessageLookupByLibrary.simpleMessage(
      "Configuración restablecida a valores predeterminados",
    ),
    "status": MessageLookupByLibrary.simpleMessage("Estado"),
    "systemMode": MessageLookupByLibrary.simpleMessage("Modo del Sistema"),
    "task": MessageLookupByLibrary.simpleMessage("Tarea"),
    "taskBoards": MessageLookupByLibrary.simpleMessage("Tableros de Tareas"),
    "taskPriority": MessageLookupByLibrary.simpleMessage(
      "Prioridad de la Tarea",
    ),
    "taskStatus": MessageLookupByLibrary.simpleMessage("Estado de la Tarea"),
    "taskTittle": MessageLookupByLibrary.simpleMessage("Título de la tarea *"),
    "tasks": MessageLookupByLibrary.simpleMessage("Tareas"),
    "themeMode": MessageLookupByLibrary.simpleMessage("Modo de Tema"),
    "themeModeMessage": MessageLookupByLibrary.simpleMessage(
      "Elige la apariencia de tu tema preferido",
    ),
    "titleRequired": MessageLookupByLibrary.simpleMessage(
      "El título es obligatorio",
    ),
    "toDo": MessageLookupByLibrary.simpleMessage("Por Hacer"),
    "total": MessageLookupByLibrary.simpleMessage("TOTAL"),
    "totalTasks": MessageLookupByLibrary.simpleMessage("Total de Tareas"),
    "version": m5,
    "yourBoards": MessageLookupByLibrary.simpleMessage("Tus Tableros"),
  };
}
