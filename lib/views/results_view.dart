import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/custom_button.dart';
import 'view_arguments/results_view_arguments.dart';

class ResultsView extends StatelessWidget {
  const ResultsView({Key? key, required this.args}) : super(key: key);

  static const String routeName = '/results';

  final ResultsViewArguments args;

  int get correctAnswers => args.correctAnswers;
  int get totalAnswers => args.quiz.questions.length;
  double get percentage => correctAnswers / totalAnswers * 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                '${args.quiz.name} Quiz',
                style: const TextStyle(fontSize: 32.0),
              ),
              const SizedBox(height: 80.0),
              const Text('Your score', style: TextStyle(fontSize: 24.0)),
              const SizedBox(height: 8.0),
              Text(
                '${percentage.round()}%',
                style: const TextStyle(
                    fontSize: 32.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40.0),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 24.0,
                  ),
                  children: [
                    const TextSpan(
                      text: 'Answered ',
                    ),
                    TextSpan(
                      text: '$correctAnswers',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(
                      text: ' out of ',
                    ),
                    TextSpan(
                      text: '$totalAnswers',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40.0),
              FutureBuilder<SharedPreferences>(
                future: SharedPreferences.getInstance(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final int? score = snapshot.data!.getInt(args.quiz.name);

                    if (score == null) {
                      return Container();
                    } else {
                      return RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 24.0,
                          ),
                          children: [
                            const TextSpan(
                              text: 'Your latest score is ',
                            ),
                            TextSpan(
                              text: '$score%',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  }
                  return Container();
                },
              ),
              const Spacer(),
              CustomButton(
                label: 'Home',
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setInt(args.quiz.name, percentage.round());
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
