import 'package:siply_quiz/data/data_sources/get_quiz_datasource.dart';
import 'package:siply_quiz/domain/entities/quiz.dart';
import 'package:siply_quiz/domain/repositories/get_quiz_repository.dart';

class GetQuizRepositoryImpl extends GetQuizRepository {
  final GetQuizDatasource _getQuizDatasource;

  GetQuizRepositoryImpl(this._getQuizDatasource);

  @override
  Future<Quiz?> call(int categoryId) => _getQuizDatasource(categoryId);
}
