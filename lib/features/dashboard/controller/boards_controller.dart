import 'package:code_challenge/models/boards_model.dart';
import 'package:code_challenge/repositories/boards_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardsControllerState {
  final List<BoardsModel> boards;
  final bool isLoading;
  final String? error;

  const BoardsControllerState({required this.boards, this.isLoading = false, this.error});

  // Initial state
  factory BoardsControllerState.initial() {
    return const BoardsControllerState(boards: [], isLoading: false);
  }

  BoardsControllerState copyWith({List<BoardsModel>? boards, bool? isLoading, String? error}) {
    return BoardsControllerState(boards: boards ?? this.boards, isLoading: isLoading ?? this.isLoading, error: error);
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
      state = state.copyWith(isLoading: false, error: 'Failed to load settings: $e');
    }
  }

  Future<void> saveBoard(BoardsModel board) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      await BoardsRepository.instance.save(board);
      state = state.copyWith(isLoading: false);
      loadBoards();
    } catch (e) {
      state = state.copyWith(isLoading: false, error: 'Failed to save board: $e');
    }
  }

  Future<void> deleteBoard(BoardsModel board) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      await BoardsRepository.instance.delete(board);
      state = state.copyWith(isLoading: false);
      loadBoards();
    } catch (e) {
      state = state.copyWith(isLoading: false, error: 'Failed to delete board: $e');
    }
  }

  Future<void> loadBoards() async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      final boards = await BoardsRepository.instance.all;
      state = state.copyWith(boards: boards, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: 'Failed to load boards: $e');
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
      state = state.copyWith(isLoading: false, error: 'Failed to update board: $e');
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
