import 'package:flutter/cupertino.dart';

class QuizPageRoute extends PageRouteBuilder {
  final Widget child;

  QuizPageRoute({required this.child})
      : super(
            transitionDuration: const Duration(milliseconds: 700),
            pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) =>
                ScaleTransition(
                  scale: animation,
                  child: child,
                ));
}
