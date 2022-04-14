import 'package:siply_quiz/domain/entities/quiz.dart';
import 'package:siply_quiz/domain/repositories/get_quiz_repository.dart';

import 'get_quiz_usecase.dart';

class GetQuizUseCaseImp extends GetQuizUseCase {
  final GetQuizRepository _repository;

  GetQuizUseCaseImp(this._repository);

  @override
  Future<Quiz?> getQuiz(int categoryId) => _repository(categoryId);
}
