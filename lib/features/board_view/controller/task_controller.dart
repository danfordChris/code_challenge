import 'package:code_challenge/models/task_model.dart';
import 'package:code_challenge/repositories/task_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskState {
  final List<TaskModel> tasks;
  final bool isLoading;
  final String? error;

  const TaskState({required this.tasks, this.isLoading = false, this.error});

  // Initial state
  factory TaskState.initial() {
    return const TaskState(tasks: [], isLoading: false);
  }

  TaskState copyWith({List<TaskModel>? tasks, bool? isLoading, String? error}) {
    return TaskState(tasks: tasks ?? this.tasks, isLoading: isLoading ?? this.isLoading, error: error);
  }
}

class TaskController extends Notifier<TaskState> {
  @override
  TaskState build() {
    return TaskState.initial();
  }

  Future<void> loadTasksByBoardId(String boardId) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      final tasks = await TaskRepository.instance.taskForBoard(boardId);
      state = state.copyWith(tasks: tasks, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: 'Failed to load tasks: $e');
    }
  }

  Future<void> saveTask(TaskModel task) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      await TaskRepository.instance.save(task);
      state = state.copyWith(isLoading: false);
      loadTasks(task);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: 'Failed to save task: $e');
    }
  }

  Future<void> deleteTask(TaskModel task) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      await TaskRepository.instance.delete(task);
      state = state.copyWith(isLoading: false);
      loadTasks(task);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: 'Failed to delete task: $e');
    }
  }

  Future<void> loadTasks(TaskModel task) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      if (task.boardId == null) throw Exception('Board ID is required to load tasks');
      final tasks = await TaskRepository.instance.taskForBoard(task.boardId!);
      state = state.copyWith(tasks: tasks, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: 'Failed to load tasks: $e');
    }
  }

  Future<void> updateTask(TaskModel task) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      await TaskRepository.instance.update(task);
      state = state.copyWith(isLoading: false);
      loadTasks(task);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: 'Failed to update task: $e');
    }
  }
}

// Provider
final tasksProvider = NotifierProvider<TaskController, TaskState>(TaskController.new);

final tasksIsLoadingProvider = Provider<bool>((ref) {
  return ref.watch(tasksProvider.select((state) => state.isLoading));
});

final tasksErrorProvider = Provider<String?>((ref) {
  return ref.watch(tasksProvider.select((state) => state.error));
});
