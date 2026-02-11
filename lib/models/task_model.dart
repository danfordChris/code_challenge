import 'package:code_challenge/core/theme/custom_colors.dart';
import 'package:code_challenge/starter_models/task_model.g.dart';
import 'package:flutter/cupertino.dart';

/// * ---------- Auto Generated Code ---------- * ///

class TaskModel extends TaskModelGen {
  TaskModel({String? id, String? boardId, String? title, String? description, int? priority, int? status, String? createdAt, String? updatedAt})
    : super(id, boardId, title, description, priority, status, createdAt, updatedAt);

  factory TaskModel.fromDatabase(Map<String, dynamic> map) {
    return TaskModelGen.fromDatabase(map);
  }

  factory TaskModel.fromJson(Map<String, dynamic> map) {
    return TaskModelGen.fromJson(map);
  }
}

enum TaskPriority {
  low,
  medium,
  high;

  static TaskPriority fromValue(int? value) {
    return TaskPriority.values.firstWhere((e) => e.value == value, orElse: () => TaskPriority.low);
  }

  String get title {
    switch (this) {
      case TaskPriority.low:
        return 'Low';
      case TaskPriority.medium:
        return 'Medium';
      case TaskPriority.high:
        return 'High';
    }
  }

  int get value {
    switch (this) {
      case TaskPriority.low:
        return 1;
      case TaskPriority.medium:
        return 2;
      case TaskPriority.high:
        return 3;
    }
  }

  Color color(BuildContext context) {
    switch (this) {
      case TaskPriority.low:
        return context.customColors.onSuccessContainer; // Green
      case TaskPriority.medium:
        return context.customColors.onWarningContainer; // Amber
      case TaskPriority.high:
        return context.customColors.onErrorContainer; // Red
    }
  }
}

enum TaskStatus {
  todo,
  inProgress,
  done;

  static TaskStatus fromValue(int? value) {
    return TaskStatus.values.firstWhere((e) => e.value == value, orElse: () => TaskStatus.todo);
  }

  String get title {
    switch (this) {
      case TaskStatus.todo:
        return 'To Do';
      case TaskStatus.inProgress:
        return 'In Progress';
      case TaskStatus.done:
        return 'Done';
    }
  }

  int get value {
    switch (this) {
      case TaskStatus.todo:
        return 1;
      case TaskStatus.inProgress:
        return 2;
      case TaskStatus.done:
        return 3;
    }
  }
}

enum PopupMenuOptions {
  edit,
  delete,
  todo,
  inProgress,
  done;

  String get title {
    switch (this) {
      case PopupMenuOptions.edit:
        return 'Edit';
      case PopupMenuOptions.delete:
        return 'Delete';
      case PopupMenuOptions.todo:
        return 'Move to To Do';
      case PopupMenuOptions.inProgress:
        return 'Move to In Progress';
      case PopupMenuOptions.done:
        return 'Move to Done';
    }
  }
}
