import 'package:siply_quiz/domain/entities/quiz_categories.dart';
import 'package:siply_quiz/domain/repositories/get_quiz_categories_repository.dart';
import 'package:siply_quiz/domain/use_cases/get_quiz_categories_usecase/get_quiz_categories_usecase.dart';

class GetQuizCategoriesUseCaseImp extends GetQuizCategoriesUseCase {
  final GetQuizCategoriesRepository _repository;

  GetQuizCategoriesUseCaseImp(this._repository);

  @override
  Future<QuizCategories?> getQuizCategories() => _repository();
}
