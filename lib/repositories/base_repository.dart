import 'package:code_challenge/services/database_manager.dart';
import 'package:flutter_pack/flutter_pack.dart';

/// * ---------- Auto Generated Code ---------- * ///

abstract class BaseRepository<T extends BaseDatabaseModel> extends BaseDataRepository<T> {
  BaseRepository(T model, T Function(Map<String, dynamic> map) generator) : super(DatabaseManager.instance, model, generator);
}
