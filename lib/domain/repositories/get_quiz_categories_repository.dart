import 'package:siply_quiz/domain/entities/quiz_categories.dart';

abstract class GetQuizCategoriesRepository {
  Future<QuizCategories?> call();
}
