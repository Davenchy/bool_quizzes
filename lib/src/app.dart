import 'package:flutter/material.dart';

import '../views/home_view.dart';
import '../views/quiz_view.dart';
import '../views/results_view.dart';
import '../views/view_arguments/quiz_view_arguments.dart';
import '../views/view_arguments/results_view_arguments.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blue,
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => const HomeView(),
              settings: settings,
            );
          case '/quiz':
            assert(
              settings.arguments is QuizViewArguments,
              'invalid arguments type',
            );
            return MaterialPageRoute(
              builder: (context) => QuizView(
                args: settings.arguments as QuizViewArguments,
              ),
              settings: settings,
            );
          case '/results':
            assert(
              settings.arguments is ResultsViewArguments,
              'invalid arguments type',
            );
            return MaterialPageRoute(
              builder: (context) => ResultsView(
                args: settings.arguments as ResultsViewArguments,
              ),
              settings: settings,
            );
        }
      },
    );
  }
}
