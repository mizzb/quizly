import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:siply_quiz/domain/entities/quiz_categories.dart';
import 'package:siply_quiz/presentation/manager/quiz_category_store.dart';
import 'package:siply_quiz/presentation/manager/quiz_store.dart';
import 'package:siply_quiz/presentation/pages/quizScreen.dart';
import 'package:siply_quiz/presentation/widgets/lottie/lottie_widget.dart';
import 'package:siply_quiz/presentation/widgets/quiz_page_route.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  final _categoryStore = GetIt.I.get<QuizCategoryStore>();
  final _quizStore = GetIt.I.get<QuizStore>();

  TriviaCategories? _selectedCategory;

  @override
  void initState() {
    super.initState();
    _categoryStore.getQuizCategories();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Observer(
              builder: (_) {
                switch (_categoryStore.state) {
                  case StoreState.init:
                    return const LottieWidget();
                  case StoreState.loading:
                    return const LottieWidget();
                  case StoreState.loaded:
                    QuizCategories? quizCategories =
                        _categoryStore.categoryResponse;
                    if (quizCategories != null &&
                        quizCategories.triviaCategories != null &&
                        quizCategories.triviaCategories!.isNotEmpty) {
                      return buildView(context, quizCategories);
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
              },
            ),
          ),
        ),
      ),
    );
  }

  Column buildView(BuildContext context, QuizCategories quizCategories) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const LottieWidget(
              lottieType: 'QUIZLY',
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.03),
              child: const Text(
                'QUIZLY',
                style: TextStyle(
                  fontSize: 46.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: 4.0,
                ),
              ),
            ),
            const Text(
              'Choose a category:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            DropdownButton(
              borderRadius: BorderRadius.circular(10),
              isExpanded: true,
              value: _selectedCategory,
              onChanged: (val) {
                setState(() {
                  _selectedCategory = val as TriviaCategories?;
                });
              },
              items: quizCategories.triviaCategories
                  ?.map<DropdownMenuItem<TriviaCategories>>(
                    (value) => DropdownMenuItem<TriviaCategories>(
                      value: value,
                      child: Text(
                        value.name!,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Colors.orange,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ))),
          child: const Text(
            'Start the Quiz',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          onPressed: () {
            if (_selectedCategory != null &&
                _selectedCategory!.id != null &&
                _selectedCategory!.name != null) {
              _quizStore.selectedCategory = _selectedCategory;
              Navigator.push(context, QuizPageRoute(child: const QuizScreen()));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please Select A Category')));
            }
          },
        ),
      ],
    );
  }
}
