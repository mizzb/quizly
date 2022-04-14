import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:siply_quiz/domain/entities/quiz.dart';
import 'package:siply_quiz/domain/entities/quiz_categories.dart';
import 'package:siply_quiz/domain/use_cases/get_quiz_usecase/get_quiz_usecase.dart';

part 'quiz_store.g.dart';

class QuizStore = QuizStoreBase with _$QuizStore;

enum QuizStoreState { init, loading, loaded }

abstract class QuizStoreBase with Store {
  final _getQuizUseCase = GetIt.I.get<GetQuizUseCase>();

  QuizStoreBase();

  @observable
  TriviaCategories? selectedCategory;

  @observable
  Quiz? quizResponse;

  @observable
  int quizNo = 0;

  @observable
  int correct = 0;

  @observable
  int incorrect = 0;

  @observable
  ObservableFuture<Quiz?>? _quizFuture;

  @computed
  QuizStoreState get state {
    if (_quizFuture == null) {
      return QuizStoreState.init;
    } else if ((_quizFuture != null &&
        _quizFuture!.status == FutureStatus.pending)) {
      return QuizStoreState.loading;
    } else {
      return QuizStoreState.loaded;
    }
  }

  @action
  Future<Quiz?> getQuiz(int categoryId) async {
    var resp = await _getQuizUseCase.getQuiz(categoryId);
    _quizFuture = ObservableFuture(Future<Quiz?>(() => resp));
    quizResponse = await _quizFuture;
    return quizResponse;
  }

  @action
  void clearStore() {
    correct = 0;
    quizNo = 0;
    incorrect = 0;
    quizResponse = null;
    _quizFuture = null;
  }
}
