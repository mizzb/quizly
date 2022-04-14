import 'package:siply_quiz/domain/entities/quiz.dart';

abstract class GetQuizUseCase {
  Future<Quiz?> getQuiz(int categoryId);
}
