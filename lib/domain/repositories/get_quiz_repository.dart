import 'package:siply_quiz/domain/entities/quiz.dart';

abstract class GetQuizRepository {
  Future<Quiz?> call(int categoryId);
}
