import 'package:ipf_flutter_starter_pack/ipf_flutter_starter_pack.dart';

void main() {
  List<BaseModelGenerator> generator = [_Task(), _Boards()];
  CodeGenerator.of('code_challenge', generator).generate();
}

class _Task extends BaseModelGenerator {
  _Task()
    : super.database('task', {
        'id': String,
        'boardId': String,
        'title': String,
        'description': String,
        'priority': int,
        'status': int,
        'createdAt': String,
        'updatedAt': String,
      });
}

class _Boards extends BaseModelGenerator {
  _Boards()
    : super.database('board', {'id': String, 'taskCount': int, 'boardName': String, 'description': String, 'createdAt': String, 'updatedAt': String});
}
