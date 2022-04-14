import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:siply_quiz/presentation/manager/quiz_category_store.dart';
import 'package:siply_quiz/presentation/manager/quiz_store.dart';

import 'data/data_sources/get_quiz_categories_datasource.dart';
import 'data/data_sources/get_quiz_datasource.dart';
import 'data/data_sources/remote/get_quiz_categories_datsource_impl.dart';
import 'data/data_sources/remote/get_quiz_datsource_impl.dart';
import 'data/repositories/get_quiz_categories_repository_impl.dart';
import 'data/repositories/get_quiz_repository_impl.dart';
import 'domain/repositories/get_quiz_categories_repository.dart';
import 'domain/repositories/get_quiz_repository.dart';
import 'domain/use_cases/get_quiz_categories_usecase/get_quiz_categories_usecase.dart';
import 'domain/use_cases/get_quiz_categories_usecase/get_quiz_categories_usecase_impl.dart';
import 'domain/use_cases/get_quiz_usecase/get_quiz_usecase.dart';
import 'domain/use_cases/get_quiz_usecase/get_quiz_usecase_impl.dart';


final getIt = GetIt.instance;

class Inject {
  static init() {
    initStore();
    initDatasource();
    initRepositories();
    initUseCases();
  }

  static initStore() {
    getIt.registerLazySingleton(() => QuizCategoryStore());
    getIt.registerLazySingleton(() => QuizStore());
  }

  static initDatasource() {
    getIt.registerLazySingleton<GetQuizCategoriesDatasource>(
        () => GetQuizCategoriesDatasourceImpl(client: http.Client()));
    getIt.registerLazySingleton<GetQuizDatasource>(
        () => GetQuizDatasourceImpl(client: http.Client()));
  }

  static initRepositories() {
    getIt.registerLazySingleton<GetQuizCategoriesRepository>(
        () => GetQuizCategoriesRepositoryImpl(getIt()));
    getIt.registerLazySingleton<GetQuizRepository>(
        () => GetQuizRepositoryImpl(getIt()));
  }

  static initUseCases() {
    getIt.registerLazySingleton<GetQuizCategoriesUseCase>(
        () => GetQuizCategoriesUseCaseImp(getIt()));
    getIt.registerLazySingleton<GetQuizUseCase>(
        () => GetQuizUseCaseImp(getIt()));
  }
}
