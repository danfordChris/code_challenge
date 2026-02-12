import 'package:code_challenge/starter_models/boards_model.g.dart';

/// * ---------- Auto Generated Code ---------- * ///

class BoardsModel extends BoardsModelGen {
  BoardsModel({String? id, int? taskCount, int? completedTaskCount, String? boardName, String? description, String? createdAt, String? updatedAt})
    : super(id, taskCount, completedTaskCount, boardName, description, createdAt, updatedAt);

  factory BoardsModel.fromDatabase(Map<String, dynamic> map) {
    return BoardsModelGen.fromDatabase(map);
  }

  factory BoardsModel.fromJson(Map<String, dynamic> map) {
    return BoardsModelGen.fromJson(map);
  }
}
