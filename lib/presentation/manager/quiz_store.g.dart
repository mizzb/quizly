// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QuizStore on QuizStoreBase, Store {
  Computed<QuizStoreState>? _$stateComputed;

  @override
  QuizStoreState get state =>
      (_$stateComputed ??= Computed<QuizStoreState>(() => super.state,
              name: 'QuizStoreBase.state'))
          .value;

  final _$selectedCategoryAtom = Atom(name: 'QuizStoreBase.selectedCategory');

  @override
  TriviaCategories? get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(TriviaCategories? value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  final _$quizResponseAtom = Atom(name: 'QuizStoreBase.quizResponse');

  @override
  Quiz? get quizResponse {
    _$quizResponseAtom.reportRead();
    return super.quizResponse;
  }

  @override
  set quizResponse(Quiz? value) {
    _$quizResponseAtom.reportWrite(value, super.quizResponse, () {
      super.quizResponse = value;
    });
  }

  final _$quizNoAtom = Atom(name: 'QuizStoreBase.quizNo');

  @override
  int get quizNo {
    _$quizNoAtom.reportRead();
    return super.quizNo;
  }

  @override
  set quizNo(int value) {
    _$quizNoAtom.reportWrite(value, super.quizNo, () {
      super.quizNo = value;
    });
  }

  final _$correctAtom = Atom(name: 'QuizStoreBase.correct');

  @override
  int get correct {
    _$correctAtom.reportRead();
    return super.correct;
  }

  @override
  set correct(int value) {
    _$correctAtom.reportWrite(value, super.correct, () {
      super.correct = value;
    });
  }

  final _$incorrectAtom = Atom(name: 'QuizStoreBase.incorrect');

  @override
  int get incorrect {
    _$incorrectAtom.reportRead();
    return super.incorrect;
  }

  @override
  set incorrect(int value) {
    _$incorrectAtom.reportWrite(value, super.incorrect, () {
      super.incorrect = value;
    });
  }

  final _$_quizFutureAtom = Atom(name: 'QuizStoreBase._quizFuture');

  @override
  ObservableFuture<Quiz?>? get _quizFuture {
    _$_quizFutureAtom.reportRead();
    return super._quizFuture;
  }

  @override
  set _quizFuture(ObservableFuture<Quiz?>? value) {
    _$_quizFutureAtom.reportWrite(value, super._quizFuture, () {
      super._quizFuture = value;
    });
  }

  final _$getQuizAsyncAction = AsyncAction('QuizStoreBase.getQuiz');

  @override
  Future<Quiz?> getQuiz(int categoryId) {
    return _$getQuizAsyncAction.run(() => super.getQuiz(categoryId));
  }

  final _$QuizStoreBaseActionController =
      ActionController(name: 'QuizStoreBase');

  @override
  void clearStore() {
    final _$actionInfo = _$QuizStoreBaseActionController.startAction(
        name: 'QuizStoreBase.clearStore');
    try {
      return super.clearStore();
    } finally {
      _$QuizStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedCategory: ${selectedCategory},
quizResponse: ${quizResponse},
quizNo: ${quizNo},
correct: ${correct},
incorrect: ${incorrect},
state: ${state}
    ''';
  }
}
