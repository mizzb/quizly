import 'package:siply_quiz/domain/entities/quiz.dart';

abstract class GetQuizDatasource {
  Future<Quiz?> call(int categoryId);
}
