import 'package:code_challenge/models/boards_model.dart';
import 'package:code_challenge/models/task_model.dart';
import 'package:code_challenge/repositories/boards_repository.dart';
import 'package:code_challenge/repositories/task_repository.dart';
import 'package:code_challenge/services/localization_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardsControllerState {
  final List<BoardsModel> boards;
  final bool isLoading;
  final String? error;
  final int? activeTasksCount;
  final int? pendingTasksCount;
  final int? completedTasksCount;

  const BoardsControllerState({
    required this.boards,
    this.isLoading = false,
    this.error,
    this.activeTasksCount,
    this.pendingTasksCount,
    this.completedTasksCount,
  });

  // Initial state
  factory BoardsControllerState.initial() {
    return const BoardsControllerState(boards: [], isLoading: false);
  }

  BoardsControllerState copyWith({
    List<BoardsModel>? boards,
    bool? isLoading,
    String? error,
    int? activeTasksCount,
    int? pendingTasksCount,
    int? completedTasksCount,
  }) {
    return BoardsControllerState(
      boards: boards ?? this.boards,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      activeTasksCount: activeTasksCount ?? this.activeTasksCount,
      pendingTasksCount: pendingTasksCount ?? this.pendingTasksCount,
      completedTasksCount: completedTasksCount ?? this.completedTasksCount,
    );
  }
}

class BoardsController extends Notifier<BoardsControllerState> {
  @override
  BoardsControllerState build() {
    _initialize();

    return BoardsControllerState.initial();
  }

  Future<void> _initialize() async {
    try {
      loadBoards();
    } catch (e) {
      state = state.copyWith(isLoading: false, error: '${Strings.instance.failedToLoadData(Strings.instance.board)} $e');
    }
  }

  Future<void> saveBoard(BoardsModel board) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      await BoardsRepository.instance.save(board);
      state = state.copyWith(isLoading: false);
      loadBoards();
    } catch (e) {
      state = state.copyWith(isLoading: false, error: '${Strings.instance.failedToSaveData(Strings.instance.board)} $e');
    }
  }

  Future<void> deleteBoard(BoardsModel board) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      await BoardsRepository.instance.delete(board);
      List<TaskModel> task = await TaskRepository.instance.taskForBoard(board.id ?? '');
      for (var t in task) {
        await TaskRepository.instance.delete(t);
      }

      state = state.copyWith(isLoading: false);
      loadBoards();
    } catch (e) {
      state = state.copyWith(isLoading: false, error: '${Strings.instance.failedToDeleteData(Strings.instance.board)} $e');
    }
  }

  Future<void> loadBoards() async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      final boards = await BoardsRepository.instance.all;
      for (var board in boards) {
        final tasks = await TaskRepository.instance.taskForBoard(board.id ?? '');
        final completedTask = await TaskRepository.instance.taskCompletedForBoard(board.id ?? '');
        board.taskCount = tasks.length;
        board.completedTaskCount = completedTask.length;
      }
      state = state.copyWith(boards: boards, isLoading: false);
      loadTaskCount();
    } catch (e) {
      state = state.copyWith(isLoading: false, error: '${Strings.instance.failedToLoadData(Strings.instance.board)} $e');
    }
  }

  Future<void> loadTaskCount() async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      final activeCount = await TaskRepository.instance.activeTask;
      final pendingCount = await TaskRepository.instance.all;
      final completedCount = await TaskRepository.instance.completedTask;
      state = state.copyWith(
        activeTasksCount: activeCount.length,
        pendingTasksCount: pendingCount.length,
        completedTasksCount: completedCount.length,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: 'Failed to load task counts: $e');
    }
  } 

  // Future<void> clearBoards() async {
  //   try {
  //     state = state.copyWith(isLoading: true, error: null);
  //     await BoardsRepository.instance.clear();
  //     state = state.copyWith(boards: [], isLoading: false);
  //   } catch (e) {
  //     state = state.copyWith(isLoading: false, error: 'Failed to clear boards: $e');
  //   }
  // }

  Future<void> refreshBoards() async {
    await loadBoards();
  }

  Future<void> updateBoard(BoardsModel board) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      await BoardsRepository.instance.update(board);
      state = state.copyWith(isLoading: false);
      loadBoards();
    } catch (e) {
      state = state.copyWith(isLoading: false, error: '${Strings.instance.failedToUpdateData(Strings.instance.board)} $e');
    }
  }
}

// Provider
final boardsProvider = NotifierProvider<BoardsController, BoardsControllerState>(BoardsController.new);

final boardsIsLoadingProvider = Provider<bool>((ref) {
  return ref.watch(boardsProvider.select((state) => state.isLoading));
});

final boardsErrorProvider = Provider<String?>((ref) {
  return ref.watch(boardsProvider.select((state) => state.error));
});
