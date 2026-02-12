import 'package:code_challenge/models/boards_model.dart';
import 'package:code_challenge/models/task_model.dart';
import 'package:code_challenge/repositories/boards_repository.dart';
import 'package:code_challenge/repositories/task_repository.dart';
import 'package:code_challenge/services/localization_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardsControllerState {
  final List<BoardsModel> boards;
  final List<BoardsModel> filteredBoards;
  final bool isLoading;
  final String? error;
  final int? activeTasksCount;
  final int? pendingTasksCount;
  final int? completedTasksCount;
  final String searchQuery;
  final TaskStatus? filterStatus;
  final List<SearchSuggestion> searchSuggestions;

  const BoardsControllerState({
    required this.boards,
    required this.filteredBoards,
    this.isLoading = false,
    this.error,
    this.activeTasksCount,
    this.pendingTasksCount,
    this.completedTasksCount,
    this.searchQuery = '',
    this.filterStatus,
    this.searchSuggestions = const [],
  });

  // Initial state
  factory BoardsControllerState.initial() {
    return const BoardsControllerState(boards: [], filteredBoards: [], isLoading: false, searchQuery: '', searchSuggestions: []);
  }

  BoardsControllerState copyWith({
    List<BoardsModel>? boards,
    List<BoardsModel>? filteredBoards,
    bool? isLoading,
    String? error,
    int? activeTasksCount,
    int? pendingTasksCount,
    int? completedTasksCount,
    String? searchQuery,
    TaskStatus? filterStatus,
    bool clearFilterStatus = false,
    List<SearchSuggestion>? searchSuggestions,
  }) {
    return BoardsControllerState(
      boards: boards ?? this.boards,
      filteredBoards: filteredBoards ?? this.filteredBoards,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      activeTasksCount: activeTasksCount ?? this.activeTasksCount,
      pendingTasksCount: pendingTasksCount ?? this.pendingTasksCount,
      completedTasksCount: completedTasksCount ?? this.completedTasksCount,
      searchQuery: searchQuery ?? this.searchQuery,
      filterStatus: clearFilterStatus ? null : (filterStatus ?? this.filterStatus),
      searchSuggestions: searchSuggestions ?? this.searchSuggestions,
    );
  }
}

enum SuggestionType { board, task }

class SearchSuggestion {
  final String id;
  final String title;
  final String? subtitle;
  final SuggestionType type;
  final String boardId;
  final String boardName;

  SearchSuggestion({required this.id, required this.title, this.subtitle, required this.type, required this.boardId, required this.boardName});
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
      _applyFilterAndSearch();
      loadTaskCount();
    } catch (e) {
      state = state.copyWith(isLoading: false, error: '${Strings.instance.failedToLoadData(Strings.instance.board)} $e');
    }
  }

  Future<void> _applyFilterAndSearch() async {
    List<BoardsModel> filtered = [];
    List<SearchSuggestion> suggestions = [];

    for (var board in state.boards) {
      bool matchesSearch = false;
      bool matchesFilter = true;

      // Search by board name
      if (board.boardName?.toLowerCase().contains(state.searchQuery.toLowerCase()) ?? false) {
        matchesSearch = true;
        if (state.searchQuery.isNotEmpty) {
          suggestions.add(
            SearchSuggestion(
              id: board.id ?? '',
              title: board.boardName ?? '',
              type: SuggestionType.board,
              boardId: board.id ?? '',
              boardName: board.boardName ?? '',
            ),
          );
        }
      }

      // Search by task name in this board
      final tasks = await TaskRepository.instance.taskForBoard(board.id ?? '');
      if (state.searchQuery.isNotEmpty) {
        for (var task in tasks) {
          if (task.title?.toLowerCase().contains(state.searchQuery.toLowerCase()) ?? false) {
            matchesSearch = true;
            suggestions.add(
              SearchSuggestion(
                id: task.id ?? '',
                title: task.title ?? '',
                subtitle: 'In ${board.boardName}',
                type: SuggestionType.task,
                boardId: board.id ?? '',
                boardName: board.boardName ?? '',
              ),
            );
          }
        }
      }

      // Filter by status
      if (state.filterStatus != null) {
        if (state.filterStatus == TaskStatus.done) {
          if (board.completedTaskCount == 0 && board.taskCount != 0) matchesFilter = false;
        } else if (state.filterStatus == TaskStatus.todo) {
          if (tasks.every((t) => t.status == TaskStatus.done.value)) matchesFilter = false;
        }
        // More complex filtering could be added here if needed.
        // For now, let's say if filterStatus is set, we check if board has any tasks with that status.
        final statusTasks = tasks.where((t) => t.status == state.filterStatus!.value).toList();
        if (statusTasks.isEmpty && tasks.isNotEmpty) matchesFilter = false;
        if (tasks.isEmpty && state.filterStatus != null) matchesFilter = false;
      }

      if (matchesSearch && matchesFilter) {
        filtered.add(board);
      }
    }

    state = state.copyWith(filteredBoards: filtered, searchSuggestions: suggestions);
  }

  void updateSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
    _applyFilterAndSearch();
  }

  void updateFilterStatus(TaskStatus? status) {
    if (status == null) {
      state = state.copyWith(clearFilterStatus: true);
    } else {
      state = state.copyWith(filterStatus: status);
    }
    _applyFilterAndSearch();
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
