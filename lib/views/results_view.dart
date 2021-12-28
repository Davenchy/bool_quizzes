import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/custom_button.dart';

class ResultsView extends StatelessWidget {
  const ResultsView({Key? key, required this.arguments}) : super(key: key);

  final List<int> arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'you answered ${arguments[0]} questions out of ${arguments[1]}\nYour score is ${arguments[0] / arguments[1] * 100}%',
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
                  await prefs.setDouble('score', arguments[0] / arguments[1]);
                  Navigator.pushNamed(context, '/');
                }),
          ],
        ),
      ),
    );
  }
}
