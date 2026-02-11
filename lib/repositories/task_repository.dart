import 'package:code_challenge/repositories/base_repository.dart';
import 'package:code_challenge/models/task_model.dart';

/// * ---------- Auto Generated Code ---------- * ///

class TaskRepository extends BaseRepository<TaskModel> {
  TaskRepository._() : super(TaskModel(), (map) => TaskModel.fromDatabase(map));
  static final TaskRepository _instance = TaskRepository._();
  static TaskRepository get instance => _instance;

  Future<List<TaskModel>> taskForBoard(String boardId) async {
    List<TaskModel> allTasks = await all;
    return allTasks.where((task) => task.boardId == boardId).toList();
  }
}
