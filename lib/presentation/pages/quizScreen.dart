import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:siply_quiz/domain/entities/quiz.dart';
import 'package:siply_quiz/presentation/manager/quiz_store.dart';
import 'package:siply_quiz/presentation/pages/summary.dart';
import 'package:siply_quiz/presentation/widgets/lottie/lottie_widget.dart';
import 'package:siply_quiz/presentation/widgets/quiz_page_route.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() {
    return _QuizScreenState();
  }
}

class _QuizScreenState extends State<QuizScreen> {
  final _quizStore = GetIt.I.get<QuizStore>();

  @override
  void initState() {
    super.initState();
    if (_quizStore.selectedCategory != null &&
        _quizStore.selectedCategory!.name != null &&
        _quizStore.selectedCategory!.id != null) {
      _quizStore.getQuiz(_quizStore.selectedCategory!.id!);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Category error')));
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _quizStore.clearStore();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 10,
        shadowColor: Colors.orange.withOpacity(0.5),
        title: Text(
          _quizStore.selectedCategory!.name!,
          style: const TextStyle(fontSize: 15),
        ),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Observer(builder: (_) {
                  switch (_quizStore.state) {
                    case QuizStoreState.init:
                      return const Center(child: LottieWidget());
                    case QuizStoreState.loading:
                      return const Center(child: LottieWidget());
                    case QuizStoreState.loaded:
                      Quiz? questions = _quizStore.quizResponse;
                      if (questions != null &&
                          questions.results != null &&
                          questions.results!.isNotEmpty) {
                        return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: buildQuizScreen(questions));
                      } else {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LottieWidget(
                              lottieType: 'MIDDLE',
                              lottieWidth:
                                  MediaQuery.of(context).size.width * 0.5,
                            ),
                            const Text(
                              'Please make sure you have internet connection and try again',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        );
                      }
                  }
                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildQuizScreen(Quiz questions) {
    List<Widget> childrens = [];
    childrens.add(AutoSizeText(
      'Question: ' + _quizStore.quizNo.toString() + " / 10",
      maxFontSize: 20,
      minFontSize: 15,
      style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
    ));

    childrens.add(
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.03,
      ),
    );

    childrens.add(Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(
          'Correct : ' + _quizStore.correct.toString(),
          maxFontSize: 20,
          minFontSize: 15,
          style:
              const TextStyle(color: Colors.green, fontWeight: FontWeight.w200),
        ),
        AutoSizeText(
          'Incorrect: ' + _quizStore.incorrect.toString(),
          maxFontSize: 20,
          minFontSize: 15,
          style:
              const TextStyle(color: Colors.red, fontWeight: FontWeight.w200),
        )
      ],
    ));

    childrens.add(
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.02,
      ),
    );

    childrens.add(const Divider(
      color: Colors.orange,
    ));

    childrens.add(
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
    );
    childrens.add(AutoSizeText(
      questions.results![_quizStore.quizNo].question!,
      minFontSize: 15,
      maxFontSize: 30,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
    ));
    childrens.add(
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ),
    );
    childrens.add(const Divider(
      color: Colors.orange,
    ));

    childrens.add(
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.05,
      ),
    );

    List<String> options = [];
    questions.results![_quizStore.quizNo].incorrectAnswers!.forEach((element) {
      options.add(element);
    });
    options.add(questions.results![_quizStore.quizNo].correctAnswer!);
    options.shuffle();

    for (var element in options) {
      childrens.add(ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.orange,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ))),
        onPressed: () {
          if (element == questions.results![_quizStore.quizNo].correctAnswer!) {
            _quizStore.correct++;
          } else {
            _quizStore.incorrect++;
          }
          if (_quizStore.quizNo < 9) {
            _quizStore.quizNo++;
          } else {
            Navigator.pushAndRemoveUntil(
                context, QuizPageRoute(child: Summary()), (route) => false);
          }
        },
        child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Center(child: AutoSizeText(element))),
      ));

      childrens.add(
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
      );
    }
    childrens.add(const AutoSizeText(
      'Select an option to continue',
      minFontSize: 6,
      maxFontSize: 12,
      style: TextStyle(fontWeight: FontWeight.w100, color: Colors.white),
    ));
    return childrens;
  }
}
