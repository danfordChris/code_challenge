import 'package:code_challenge/models/task_model.dart';
import 'package:ipf_flutter_starter_pack/ipf_flutter_starter_pack.dart';

/// * ---------- Auto Generated Code ---------- * ///

class TaskModelGen extends BaseDatabaseModel {
	String? _id;
	String? _boardId;
	String? _title;
	String? _description;
	int? _priority;
	int? _status;
	String? _createdAt;
	String? _updatedAt;
	
	TaskModelGen(this._id, this._boardId, this._title, this._description, this._priority, this._status, this._createdAt, this._updatedAt, );

	String? get id => _id;
	String? get boardId => _boardId;
	String? get title => _title;
	String? get description => _description;
	int? get priority => _priority;
	int? get status => _status;
	String? get createdAt => _createdAt;
	String? get updatedAt => _updatedAt;
	
	set id(String? id) => this._id = id;
	set boardId(String? boardId) => this._boardId = boardId;
	set title(String? title) => this._title = title;
	set description(String? description) => this._description = description;
	set priority(int? priority) => this._priority = priority;
	set status(int? status) => this._status = status;
	set createdAt(String? createdAt) => this._createdAt = createdAt;
	set updatedAt(String? updatedAt) => this._updatedAt = updatedAt;
	
	static TaskModel fromJson(Map<String, dynamic> map) {
		return TaskModel(id: map['id'], boardId: map['boardId'], title: map['title'], description: map['description'], priority: BaseModel.castToInt(map['priority']), status: BaseModel.castToInt(map['status']), createdAt: map['createdAt'], updatedAt: map['updatedAt'], );
	}

	static TaskModel fromDatabase(Map<String, dynamic> map) {
		return TaskModel(id: map['id'], boardId: map['board_id'], title: map['title'], description: map['description'], priority: BaseModel.castToInt(map['priority']), status: BaseModel.castToInt(map['status']), createdAt: map['created_at'], updatedAt: map['updated_at'], );
	}

	@override
	String get tableName => "task";

	@override
	Map<String, dynamic> get toMap {
		return { "id": id, "board_id": boardId, "title": title, "description": description, "priority": priority, "status": status, "created_at": createdAt, "updated_at": updatedAt, };
	}

	Map<String, dynamic> get toJson {
		return { "id": id, "boardId": boardId, "title": title, "description": description, "priority": priority, "status": status, "createdAt": createdAt, "updatedAt": updatedAt, };
	}

	@override
	Map<String, String> get toSchema {
		return { "id": "TEXT PRIMARY KEY", "board_id": "TEXT", "title": "TEXT", "description": "TEXT", "priority": "INTEGER", "status": "INTEGER", "created_at": "TEXT", "updated_at": "TEXT", };
	}

	TaskModel merge(TaskModel model) {
		_id = model.id ?? this._id;
		_boardId = model.boardId ?? this._boardId;
		_title = model.title ?? this._title;
		_description = model.description ?? this._description;
		_priority = model.priority ?? this._priority;
		_status = model.status ?? this._status;
		_createdAt = model.createdAt ?? this._createdAt;
		_updatedAt = model.updatedAt ?? this._updatedAt;
		return TaskModel(
			id: model.id ?? _id,
			boardId: model.boardId ?? _boardId,
			title: model.title ?? _title,
			description: model.description ?? _description,
			priority: model.priority ?? _priority,
			status: model.status ?? _status,
			createdAt: model.createdAt ?? _createdAt,
			updatedAt: model.updatedAt ?? _updatedAt
		);
	}

	TaskModel mergeWith({String? id, String? boardId, String? title, String? description, int? priority, int? status, String? createdAt, String? updatedAt}) {
		_id = id ?? this._id;
		_boardId = boardId ?? this._boardId;
		_title = title ?? this._title;
		_description = description ?? this._description;
		_priority = priority ?? this._priority;
		_status = status ?? this._status;
		_createdAt = createdAt ?? this._createdAt;
		_updatedAt = updatedAt ?? this._updatedAt;
		return TaskModel(
			id: id ?? _id,
			boardId: boardId ?? _boardId,
			title: title ?? _title,
			description: description ?? _description,
			priority: priority ?? _priority,
			status: status ?? _status,
			createdAt: createdAt ?? _createdAt,
			updatedAt: updatedAt ?? _updatedAt
		);
	}

	TaskModel copy(TaskModel model) {
		return TaskModel(
			id: model.id ?? _id,
			boardId: model.boardId ?? _boardId,
			title: model.title ?? _title,
			description: model.description ?? _description,
			priority: model.priority ?? _priority,
			status: model.status ?? _status,
			createdAt: model.createdAt ?? _createdAt,
			updatedAt: model.updatedAt ?? _updatedAt
		);
	}

	TaskModel copyWith({String? id, String? boardId, String? title, String? description, int? priority, int? status, String? createdAt, String? updatedAt}) {
		return TaskModel(
			id: id ?? _id,
			boardId: boardId ?? _boardId,
			title: title ?? _title,
			description: description ?? _description,
			priority: priority ?? _priority,
			status: status ?? _status,
			createdAt: createdAt ?? _createdAt,
			updatedAt: updatedAt ?? _updatedAt
		);
	}

	@override
	Map<String, Map<String, String>>? get dataRelation => null;

}