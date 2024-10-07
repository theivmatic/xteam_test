import 'dart:developer';
import 'package:xteam_test/src/core/constants/api_path.dart';
import 'package:xteam_test/src/feature/home/domain/entity/task.dart';
import 'package:xteam_test/src/feature/home/domain/repository/home_api.dart';
import 'package:http/http.dart' as http;

class HomeApiImpl extends HomeApi {
  final http.Client? _client;

  HomeApiImpl({required http.Client? client}) : _client = client;

  @override
  Future<List<TaskEntity>> getTasks() async {
    final response = await _client!.get(
      Uri.parse('${ApiPath.taskBaseUrl}/todos'),
    );
    if (response.statusCode == 200) {
      log('Tasks fetched');
      return listEntityDataFromString(response.body);
    } else {
      throw Exception(
        'Status code: ${response.statusCode}, Message: ${response.reasonPhrase}',
      );
    }
  }
}
