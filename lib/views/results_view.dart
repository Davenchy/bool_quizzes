import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/custom_button.dart';
import 'view_arguments/results_view_arguments.dart';

class ResultsView extends StatelessWidget {
  const ResultsView({Key? key, required this.args}) : super(key: key);

  static const String routeName = '/results';

  final ResultsViewArguments args;

  int get correctAnswers => args.correctAnswers;
  int get totalAnswers => args.totalAnswers;
  double get percentage => correctAnswers / totalAnswers * 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'you answered $correctAnswers questions out of $totalAnswers\nYour score is $percentage%',
                style: const TextStyle(fontSize: 24),
              ),
              // TODO: implement show last score if exists
              // Divider(),
              // Text(
              //   'Last Score is Z',
              //   style: TextStyle(fontSize: 20),
              // ),
              CustomButton(
                label: 'Home',
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setDouble('score', percentage / 100);
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
