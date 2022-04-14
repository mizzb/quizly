import 'package:flutter/material.dart';
import 'package:siply_quiz/presentation/pages/home.dart';

import 'injection_container.dart';

void main() {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  Inject.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizly',
      home: Home(),
    );
  }
}
