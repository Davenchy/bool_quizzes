import 'package:flutter/material.dart';

import 'quiz_view.dart';
import '../utils/quizzes.dart';
import '../components/custom_button.dart';
import 'view_arguments/quiz_view_arguments.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Quizzes',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Select question type',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: ListView.builder(
                    itemCount: kQuizzes.length,
                    itemBuilder: (context, index) {
                      final quiz = kQuizzes[index];
                      return CustomButton(
                        label: quiz.name,
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            QuizView.routeName,
                            arguments: QuizViewArguments(quiz: quiz),
                          );
                        },
                      );
                    },
                  ),
                ),
                // FutureBuilder<SharedPreferences>(
                //   future: SharedPreferences.getInstance(),
                //   builder: (context, snapshot) {
                //     if (snapshot.hasData) {
                //       final double? score = snapshot.data!.getDouble('score');

                //       if (score == null) {
                //         return Container();
                //       } else {
                //         return Text('latest score is ${score * 100}%');
                //       }
                //     }
                //     return Container();
                //   },
                // ),
                // CustomButton(
                //     label: 'type 1', onPressed: () => start(context, 'type1')),
                // CustomButton(
                //     label: 'type 2', onPressed: () => start(context, 'type1')),
                // CustomButton(
                //     label: 'type 3', onPressed: () => start(context, 'type1')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
