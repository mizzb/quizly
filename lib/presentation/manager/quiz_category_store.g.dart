// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_category_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QuizCategoryStore on QuizCategoryStoreBase, Store {
  Computed<StoreState>? _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state,
              name: 'QuizCategoryStoreBase.state'))
          .value;

  final _$categoryResponseAtom =
      Atom(name: 'QuizCategoryStoreBase.categoryResponse');

  @override
  QuizCategories? get categoryResponse {
    _$categoryResponseAtom.reportRead();
    return super.categoryResponse;
  }

  @override
  set categoryResponse(QuizCategories? value) {
    _$categoryResponseAtom.reportWrite(value, super.categoryResponse, () {
      super.categoryResponse = value;
    });
  }

  final _$_quizCategoryFutureAtom =
      Atom(name: 'QuizCategoryStoreBase._quizCategoryFuture');

  @override
  ObservableFuture<QuizCategories?>? get _quizCategoryFuture {
    _$_quizCategoryFutureAtom.reportRead();
    return super._quizCategoryFuture;
  }

  @override
  set _quizCategoryFuture(ObservableFuture<QuizCategories?>? value) {
    _$_quizCategoryFutureAtom.reportWrite(value, super._quizCategoryFuture, () {
      super._quizCategoryFuture = value;
    });
  }

  final _$getQuizCategoriesAsyncAction =
      AsyncAction('QuizCategoryStoreBase.getQuizCategories');

  @override
  Future<QuizCategories?> getQuizCategories() {
    return _$getQuizCategoriesAsyncAction.run(() => super.getQuizCategories());
  }

  @override
  String toString() {
    return '''
categoryResponse: ${categoryResponse},
state: ${state}
    ''';
  }
}
