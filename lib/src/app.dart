import 'package:flutter/material.dart';

import '../views/home_view.dart';
import '../views/results_view.dart';
import '../views/quiz_view.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => const HomeView(),
            );
          case '/questions':
            return MaterialPageRoute(
              builder: (context) => QuizView(
                questionsType: settings.arguments as String,
              ),
            );
          case '/results':
            return MaterialPageRoute(
              builder: (context) => ResultsView(
                arguments: settings.arguments as List<int>,
              ),
            );
        }
      },
    );
  }
}
