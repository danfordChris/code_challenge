import 'package:code_challenge/repositories/base_repository.dart';
import 'package:code_challenge/models/boards_model.dart';

/// * ---------- Auto Generated Code ---------- * ///

class BoardsRepository extends BaseRepository<BoardsModel> {
	BoardsRepository._(): super(BoardsModel(), (map) => BoardsModel.fromDatabase(map));
	static final BoardsRepository _instance = BoardsRepository._();
	static BoardsRepository get instance => _instance;

}