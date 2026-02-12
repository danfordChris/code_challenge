import 'package:flutter_pack/flutter_pack.dart';
import 'package:code_challenge/models/task_model.dart';
import 'package:code_challenge/models/boards_model.dart';

class DatabaseManager extends BaseDatabaseManager {
	DatabaseManager._(): super("code_challenge.db", 1, _tables);
	static final DatabaseManager _instance = DatabaseManager._();
	static DatabaseManager get instance => _instance;

	static List<BaseDatabaseModel> get _tables {
		return [
			TaskModel(),
			BoardsModel()
		];
	}
}