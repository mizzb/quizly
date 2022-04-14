import 'package:siply_quiz/domain/entities/quiz_categories.dart';

abstract class GetQuizCategoriesDatasource {
  Future<QuizCategories?> call();
}
