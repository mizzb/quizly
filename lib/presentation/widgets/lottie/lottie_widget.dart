import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class LottieWidget extends StatelessWidget {
  final String? lottieType;

  final double? lottieWidth;
  final int? lottieDuration;

  const LottieWidget(
      {Key? key, this.lottieType, this.lottieWidth, this.lottieDuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (lottieWidth != null)
          ? lottieWidth
          : MediaQuery.of(context).size.width * 0.25,
      child: loadLottie(lottieType, context),
    );
  }

  loadLottie(lottieType, context) {
    switch (lottieType) {
      case 'LOADING':
        return fetchLottie(context, 'assets/lottie/loading.json');
      case 'WINNER':
        return fetchLottie(context, 'assets/lottie/quiz-guy-smile.json');
      case 'LOOSER':
        return fetchLottie(context, 'assets/lottie/quiz-guy-loser.json');
      case 'MIDDLE':
        return fetchLottie(context, 'assets/lottie/quiz-guy-question.json');
      case 'QUIZLY':
        return fetchLottie(context, 'assets/lottie/quizly.json');
      default:
        return fetchLottie(context, 'assets/lottie/loading.json');
    }
  }

  LottieBuilder fetchLottie(context, path) {
    return Lottie.asset(
      path,
      key: UniqueKey(),
      frameBuilder: (context, child, composition) {
        return AnimatedOpacity(
          child: child,
          opacity: 1,
          duration: Duration(
              seconds: (lottieDuration != null) ? lottieDuration! : 120),
        );
      },
    );
  }
}
