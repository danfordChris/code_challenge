import 'package:code_challenge/models/boards_model.dart';
import 'package:flutter_pack/flutter_pack.dart';

/// * ---------- Auto Generated Code ---------- * ///

class BoardsModelGen extends BaseDatabaseModel {
	String? _id;
	int? _taskCount;
	int? _completedTaskCount;
	String? _boardName;
	String? _description;
	String? _createdAt;
	String? _updatedAt;
	
	BoardsModelGen(this._id, this._taskCount, this._completedTaskCount, this._boardName, this._description, this._createdAt, this._updatedAt, );

	String? get id => _id;
	int? get taskCount => _taskCount;
	int? get completedTaskCount => _completedTaskCount;
	String? get boardName => _boardName;
	String? get description => _description;
	String? get createdAt => _createdAt;
	String? get updatedAt => _updatedAt;
	
	set id(String? id) => this._id = id;
	set taskCount(int? taskCount) => this._taskCount = taskCount;
	set completedTaskCount(int? completedTaskCount) => this._completedTaskCount = completedTaskCount;
	set boardName(String? boardName) => this._boardName = boardName;
	set description(String? description) => this._description = description;
	set createdAt(String? createdAt) => this._createdAt = createdAt;
	set updatedAt(String? updatedAt) => this._updatedAt = updatedAt;
	
	static BoardsModel fromJson(Map<String, dynamic> map) {
		return BoardsModel(id: map['id'], taskCount: BaseModel.castToInt(map['taskCount']), completedTaskCount: BaseModel.castToInt(map['completedTaskCount']), boardName: map['boardName'], description: map['description'], createdAt: map['createdAt'], updatedAt: map['updatedAt'], );
	}

	static BoardsModel fromDatabase(Map<String, dynamic> map) {
		return BoardsModel(id: map['id'], taskCount: BaseModel.castToInt(map['task_count']), completedTaskCount: BaseModel.castToInt(map['completed_task_count']), boardName: map['board_name'], description: map['description'], createdAt: map['created_at'], updatedAt: map['updated_at'], );
	}

	@override
	String get tableName => "board";

	@override
	Map<String, dynamic> get toMap {
		return { "id": id, "task_count": taskCount, "completed_task_count": completedTaskCount, "board_name": boardName, "description": description, "created_at": createdAt, "updated_at": updatedAt, };
	}

	Map<String, dynamic> get toJson {
		return { "id": id, "taskCount": taskCount, "completedTaskCount": completedTaskCount, "boardName": boardName, "description": description, "createdAt": createdAt, "updatedAt": updatedAt, };
	}

	@override
	Map<String, String> get toSchema {
		return { "id": "TEXT PRIMARY KEY", "task_count": "INTEGER", "completed_task_count": "INTEGER", "board_name": "TEXT", "description": "TEXT", "created_at": "TEXT", "updated_at": "TEXT", };
	}

	BoardsModel merge(BoardsModel model) {
		return BoardsModel(
			id: model.id ?? this._id,
			taskCount: model.taskCount ?? this._taskCount,
			completedTaskCount: model.completedTaskCount ?? this._completedTaskCount,
			boardName: model.boardName ?? this._boardName,
			description: model.description ?? this._description,
			createdAt: model.createdAt ?? this._createdAt,
			updatedAt: model.updatedAt ?? this._updatedAt
		);
	}

	@override
	Map<String, Map<String, String>>? get dataRelation => null;

}