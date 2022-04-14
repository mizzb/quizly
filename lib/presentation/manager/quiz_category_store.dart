import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:siply_quiz/domain/entities/quiz_categories.dart';
import 'package:siply_quiz/domain/use_cases/get_quiz_categories_usecase/get_quiz_categories_usecase.dart';

part 'quiz_category_store.g.dart';

class QuizCategoryStore = QuizCategoryStoreBase with _$QuizCategoryStore;

enum StoreState { init, loading, loaded }

abstract class QuizCategoryStoreBase with Store {
  final _getQuizCategoriesUseCase = GetIt.I.get<GetQuizCategoriesUseCase>();

  QuizCategoryStoreBase();

  @observable
  QuizCategories? categoryResponse;

  @observable
  ObservableFuture<QuizCategories?>? _quizCategoryFuture;

  @computed
  StoreState get state {
    if (_quizCategoryFuture == null) {
      return StoreState.init;
    } else if ((_quizCategoryFuture != null &&
        _quizCategoryFuture!.status == FutureStatus.pending)) {
      return StoreState.loading;
    } else {
      return StoreState.loaded;
    }
  }

  @action
  Future<QuizCategories?> getQuizCategories() async {
    var resp = await _getQuizCategoriesUseCase.getQuizCategories();
    _quizCategoryFuture = ObservableFuture(Future<QuizCategories?>(() => resp));
    categoryResponse = await _quizCategoryFuture;
    return categoryResponse;
  }
}
