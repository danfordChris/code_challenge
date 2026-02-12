// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  static String m0(language) => "Langue changée en ${language}";

  static String m1(dataType) => "Échec de la suppression de ${dataType} :";

  static String m2(dataType) => "Échec du chargement de ${dataType} :";

  static String m3(dataType) => "Échec de la sauvegarde de ${dataType} :";

  static String m4(dataType) => "Échec de la mise à jour de ${dataType} :";

  static String m5(version) => "Version ${version}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "active": MessageLookupByLibrary.simpleMessage("ACTIF"),
    "addTask": MessageLookupByLibrary.simpleMessage("Ajouter une Tâche"),
    "all": MessageLookupByLibrary.simpleMessage("Tous"),
    "appearance": MessageLookupByLibrary.simpleMessage("Apparence"),
    "board": MessageLookupByLibrary.simpleMessage("Tableau"),
    "boardName": MessageLookupByLibrary.simpleMessage("Nom du Tableau *"),
    "boardNameIsRequired": MessageLookupByLibrary.simpleMessage(
      "Le nom du tableau est requis",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Annuler"),
    "changeLanguageMessage": m0,
    "clearDatabase": MessageLookupByLibrary.simpleMessage(
      "Vider la Base de Données",
    ),
    "clearDatabaseMessage": MessageLookupByLibrary.simpleMessage(
      "Cela supprimera tous les tableaux et toutes les tâches. Cette action est irréversible. Êtes-vous sûr ?",
    ),
    "clearFilter": MessageLookupByLibrary.simpleMessage("Effacer le Filtre"),
    "completed": MessageLookupByLibrary.simpleMessage("Terminées"),
    "createBoard": MessageLookupByLibrary.simpleMessage("Créer un Tableau"),
    "createBoardMessage": MessageLookupByLibrary.simpleMessage(
      "Créez votre premier tableau pour commencer",
    ),
    "darkMode": MessageLookupByLibrary.simpleMessage("Mode Sombre"),
    "dataManagement": MessageLookupByLibrary.simpleMessage(
      "Gestion des Données",
    ),
    "databaseCleared": MessageLookupByLibrary.simpleMessage(
      "Base de données vidée avec succès",
    ),
    "databasePopulated": MessageLookupByLibrary.simpleMessage(
      "Base de données peuplée avec succès",
    ),
    "dayAgo": MessageLookupByLibrary.simpleMessage("j"),
    "delete": MessageLookupByLibrary.simpleMessage("Supprimer"),
    "deleteTask": MessageLookupByLibrary.simpleMessage("Supprimer la Tâche"),
    "deleteTaskQuestion": MessageLookupByLibrary.simpleMessage(
      "Êtes-vous sûr de vouloir supprimer cette tâche ?",
    ),
    "description": MessageLookupByLibrary.simpleMessage("Description"),
    "descriptionHint": MessageLookupByLibrary.simpleMessage(
      "Ajouter une description (optionnel)",
    ),
    "dismiss": MessageLookupByLibrary.simpleMessage("Ignorer"),
    "done": MessageLookupByLibrary.simpleMessage("TERMINÉ"),
    "doneStatus": MessageLookupByLibrary.simpleMessage("Terminé"),
    "edit": MessageLookupByLibrary.simpleMessage("Modifier"),
    "editBoard": MessageLookupByLibrary.simpleMessage("Modifier le Tableau"),
    "editTask": MessageLookupByLibrary.simpleMessage("Modifier la Tâche"),
    "failedToChangeLanguage": MessageLookupByLibrary.simpleMessage(
      "Échec du changement de langue",
    ),
    "failedToChangeTheme": MessageLookupByLibrary.simpleMessage(
      "Échec du changement de thème",
    ),
    "failedToClearDatabase": MessageLookupByLibrary.simpleMessage(
      "Échec du vidage de la base de données",
    ),
    "failedToDeleteData": m1,
    "failedToLoadData": m2,
    "failedToLoadSettings": MessageLookupByLibrary.simpleMessage(
      "Échec du chargement des paramètres",
    ),
    "failedToPopulateDatabase": MessageLookupByLibrary.simpleMessage(
      "Échec du peuplement de la base de données",
    ),
    "failedToResetSettings": MessageLookupByLibrary.simpleMessage(
      "Échec de la réinitialisation des paramètres",
    ),
    "failedToSaveData": m3,
    "failedToUpdateData": m4,
    "filterByStatus": MessageLookupByLibrary.simpleMessage(
      "Filtrer par Statut de Tâche",
    ),
    "high": MessageLookupByLibrary.simpleMessage("Haute"),
    "hourAgo": MessageLookupByLibrary.simpleMessage("h"),
    "inProgress": MessageLookupByLibrary.simpleMessage("En Cours"),
    "justNow": MessageLookupByLibrary.simpleMessage("À l\'instant"),
    "language": MessageLookupByLibrary.simpleMessage("Langue"),
    "lightMode": MessageLookupByLibrary.simpleMessage("Mode Clair"),
    "low": MessageLookupByLibrary.simpleMessage("Basse"),
    "medium": MessageLookupByLibrary.simpleMessage("Moyenne"),
    "minuteAgo": MessageLookupByLibrary.simpleMessage("m"),
    "noBoardsYet": MessageLookupByLibrary.simpleMessage(
      "Pas encore de tableaux",
    ),
    "noResultsFound": MessageLookupByLibrary.simpleMessage(
      "Aucun résultat trouvé",
    ),
    "populateDatabase": MessageLookupByLibrary.simpleMessage(
      "Peupler la Base de Données",
    ),
    "populateDatabaseMessage": MessageLookupByLibrary.simpleMessage(
      "Cela ajoutera des exemples de données à votre base de données. Êtes-vous sûr ?",
    ),
    "priority": MessageLookupByLibrary.simpleMessage("Priorité"),
    "progress": MessageLookupByLibrary.simpleMessage("Progression"),
    "reset": MessageLookupByLibrary.simpleMessage("Réinitialiser"),
    "resetSettings": MessageLookupByLibrary.simpleMessage(
      "Réinitialiser les Paramètres",
    ),
    "resetSettingsMessage": MessageLookupByLibrary.simpleMessage(
      "Êtes-vous sûr de vouloir réinitialiser tous les paramètres par défaut ?",
    ),
    "results": MessageLookupByLibrary.simpleMessage("Résultats"),
    "save": MessageLookupByLibrary.simpleMessage("Enregistrer"),
    "searchHint": MessageLookupByLibrary.simpleMessage(
      "Rechercher des tableaux ou des tâches...",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Paramètres"),
    "settingsResetToDefault": MessageLookupByLibrary.simpleMessage(
      "Paramètres réinitialisés par défaut",
    ),
    "status": MessageLookupByLibrary.simpleMessage("Statut"),
    "systemMode": MessageLookupByLibrary.simpleMessage("Mode Système"),
    "task": MessageLookupByLibrary.simpleMessage("Tâche"),
    "taskBoards": MessageLookupByLibrary.simpleMessage("Tableaux de Tâches"),
    "taskPriority": MessageLookupByLibrary.simpleMessage(
      "Priorité de la Tâche",
    ),
    "taskStatus": MessageLookupByLibrary.simpleMessage("Statut de la Tâche"),
    "taskTittle": MessageLookupByLibrary.simpleMessage("Titre de la tâche *"),
    "tasks": MessageLookupByLibrary.simpleMessage("Tâches"),
    "themeMode": MessageLookupByLibrary.simpleMessage("Mode du Thème"),
    "themeModeMessage": MessageLookupByLibrary.simpleMessage(
      "Choisissez l\'apparence de votre thème préféré",
    ),
    "titleRequired": MessageLookupByLibrary.simpleMessage(
      "Le titre est requis",
    ),
    "toDo": MessageLookupByLibrary.simpleMessage("À Faire"),
    "total": MessageLookupByLibrary.simpleMessage("TOTAL"),
    "totalTasks": MessageLookupByLibrary.simpleMessage("Total des Tâches"),
    "version": m5,
    "yourBoards": MessageLookupByLibrary.simpleMessage("Vos Tableaux"),
  };
}
