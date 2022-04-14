import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:siply_quiz/domain/entities/quiz.dart';

import '../get_quiz_datasource.dart';

class GetQuizDatasourceImpl extends GetQuizDatasource {
  final http.Client client;

  GetQuizDatasourceImpl({required this.client});

  @override
  Future<Quiz?> call(int categoryId) async {
    Quiz? _quiz;
    final response = await client.get(
      Uri.parse(
          'https://opentdb.com/api.php?amount=10&difficulty=easy&category=' +
              categoryId.toString()),
    );
    if (response.statusCode == 200) {
      _quiz = Quiz.fromJson(json.decode(response.body));
      return _quiz;
    } else {
      return _quiz;
    }
  }
}
