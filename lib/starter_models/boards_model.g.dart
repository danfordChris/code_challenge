import 'package:code_challenge/models/boards_model.dart';
import 'package:ipf_flutter_starter_pack/ipf_flutter_starter_pack.dart';

/// * ---------- Auto Generated Code ---------- * ///

class BoardsModelGen extends BaseDatabaseModel {
	String? _id;
	int? _taskCount;
	String? _boardName;
	String? _description;
	String? _createdAt;
	String? _updatedAt;
	
	BoardsModelGen(this._id, this._taskCount, this._boardName, this._description, this._createdAt, this._updatedAt, );

	String? get id => _id;
	int? get taskCount => _taskCount;
	String? get boardName => _boardName;
	String? get description => _description;
	String? get createdAt => _createdAt;
	String? get updatedAt => _updatedAt;
	
	set id(String? id) => this._id = id;
	set taskCount(int? taskCount) => this._taskCount = taskCount;
	set boardName(String? boardName) => this._boardName = boardName;
	set description(String? description) => this._description = description;
	set createdAt(String? createdAt) => this._createdAt = createdAt;
	set updatedAt(String? updatedAt) => this._updatedAt = updatedAt;
	
	static BoardsModel fromJson(Map<String, dynamic> map) {
		return BoardsModel(id: map['id'], taskCount: BaseModel.castToInt(map['taskCount']), boardName: map['boardName'], description: map['description'], createdAt: map['createdAt'], updatedAt: map['updatedAt'], );
	}

	static BoardsModel fromDatabase(Map<String, dynamic> map) {
		return BoardsModel(id: map['id'], taskCount: BaseModel.castToInt(map['task_count']), boardName: map['board_name'], description: map['description'], createdAt: map['created_at'], updatedAt: map['updated_at'], );
	}

	@override
	String get tableName => "board";

	@override
	Map<String, dynamic> get toMap {
		return { "id": id, "task_count": taskCount, "board_name": boardName, "description": description, "created_at": createdAt, "updated_at": updatedAt, };
	}

	Map<String, dynamic> get toJson {
		return { "id": id, "taskCount": taskCount, "boardName": boardName, "description": description, "createdAt": createdAt, "updatedAt": updatedAt, };
	}

	@override
	Map<String, String> get toSchema {
		return { "id": "TEXT PRIMARY KEY", "task_count": "INTEGER", "board_name": "TEXT", "description": "TEXT", "created_at": "TEXT", "updated_at": "TEXT", };
	}

	BoardsModel merge(BoardsModel model) {
		_id = model.id ?? this._id;
		_taskCount = model.taskCount ?? this._taskCount;
		_boardName = model.boardName ?? this._boardName;
		_description = model.description ?? this._description;
		_createdAt = model.createdAt ?? this._createdAt;
		_updatedAt = model.updatedAt ?? this._updatedAt;
		return BoardsModel(
			id: model.id ?? _id,
			taskCount: model.taskCount ?? _taskCount,
			boardName: model.boardName ?? _boardName,
			description: model.description ?? _description,
			createdAt: model.createdAt ?? _createdAt,
			updatedAt: model.updatedAt ?? _updatedAt
		);
	}

	BoardsModel mergeWith({String? id, int? taskCount, String? boardName, String? description, String? createdAt, String? updatedAt}) {
		_id = id ?? this._id;
		_taskCount = taskCount ?? this._taskCount;
		_boardName = boardName ?? this._boardName;
		_description = description ?? this._description;
		_createdAt = createdAt ?? this._createdAt;
		_updatedAt = updatedAt ?? this._updatedAt;
		return BoardsModel(
			id: id ?? _id,
			taskCount: taskCount ?? _taskCount,
			boardName: boardName ?? _boardName,
			description: description ?? _description,
			createdAt: createdAt ?? _createdAt,
			updatedAt: updatedAt ?? _updatedAt
		);
	}

	BoardsModel copy(BoardsModel model) {
		return BoardsModel(
			id: model.id ?? _id,
			taskCount: model.taskCount ?? _taskCount,
			boardName: model.boardName ?? _boardName,
			description: model.description ?? _description,
			createdAt: model.createdAt ?? _createdAt,
			updatedAt: model.updatedAt ?? _updatedAt
		);
	}

	BoardsModel copyWith({String? id, int? taskCount, String? boardName, String? description, String? createdAt, String? updatedAt}) {
		return BoardsModel(
			id: id ?? _id,
			taskCount: taskCount ?? _taskCount,
			boardName: boardName ?? _boardName,
			description: description ?? _description,
			createdAt: createdAt ?? _createdAt,
			updatedAt: updatedAt ?? _updatedAt
		);
	}

	@override
	Map<String, Map<String, String>>? get dataRelation => null;

}