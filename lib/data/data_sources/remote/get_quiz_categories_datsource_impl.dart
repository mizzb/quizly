import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:siply_quiz/data/data_sources/get_quiz_categories_datasource.dart';
import 'package:siply_quiz/domain/entities/quiz_categories.dart';

class GetQuizCategoriesDatasourceImpl extends GetQuizCategoriesDatasource {
  final http.Client client;

  GetQuizCategoriesDatasourceImpl({required this.client});

  @override
  Future<QuizCategories?> call() async {
    QuizCategories? _quizCategories;
    final response = await client.get(
      Uri.parse('https://opentdb.com/api_category.php'),
    );
    if (response.statusCode == 200) {
      _quizCategories = QuizCategories.fromJson(json.decode(response.body));
      return _quizCategories;
    } else {
      return _quizCategories;
    }
  }
}
