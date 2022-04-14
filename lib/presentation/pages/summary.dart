import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:siply_quiz/presentation/manager/quiz_store.dart';
import 'package:siply_quiz/presentation/widgets/lottie/lottie_widget.dart';
import 'package:siply_quiz/presentation/widgets/quiz_page_route.dart';

import 'home.dart';

class Summary extends StatelessWidget {
  Summary({Key? key}) : super(key: key);

  final _quizStore = GetIt.I.get<QuizStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: buildSummaryView(context)),
          ),
        ),
      ),
    );
  }

  List<Widget> buildSummaryView(BuildContext context) {
    List<Widget> childrens = [];

    if (_quizStore.correct > 5) {
      childrens.add(LottieWidget(
        lottieType: 'WINNER',
        lottieWidth: MediaQuery.of(context).size.width * 0.7,
      ));
    } else if (_quizStore.correct < 5) {
      childrens.add(LottieWidget(
        lottieType: 'LOOSER',
        lottieWidth: MediaQuery.of(context).size.width * 0.7,
      ));
    } else {
      childrens.add(LottieWidget(
        lottieType: 'MIDDLE',
        lottieWidth: MediaQuery.of(context).size.width * 0.7,
      ));
    }

    childrens.add(AutoSizeText(
      'You have answered ' +
          _quizStore.correct.toString() +
          ' out of 10 questions ! ',
      minFontSize: 15,
      maxFontSize: 30,
      style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
    ));

    childrens.add(const Divider(
      color: Colors.orange,
    ));

    childrens.add(ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.orange,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ))),
      child: const Text(
        'Retake the Quiz',
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      onPressed: () {
        Navigator.pushAndRemoveUntil(
            context, QuizPageRoute(child: Home()), (route) => false);
      },
    ));

    return childrens;
  }
}
