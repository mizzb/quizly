import 'package:siply_quiz/data/data_sources/get_quiz_categories_datasource.dart';
import 'package:siply_quiz/domain/entities/quiz_categories.dart';
import 'package:siply_quiz/domain/repositories/get_quiz_categories_repository.dart';

class GetQuizCategoriesRepositoryImpl extends GetQuizCategoriesRepository {
  final GetQuizCategoriesDatasource _getQuizCategoriesDatasource;

  GetQuizCategoriesRepositoryImpl(this._getQuizCategoriesDatasource);

  @override
  Future<QuizCategories?> call() => _getQuizCategoriesDatasource();
}
