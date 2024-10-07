import 'package:xteam_test/src/feature/home/domain/entity/task.dart';

abstract class HomeApi {
  Future<List<TaskEntity>> getTasks();
}
