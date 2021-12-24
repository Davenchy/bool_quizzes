import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workstationmode/components/custom_buttom.dart';

import 'first_view.dart';

class Result extends StatelessWidget {
  const Result({Key? key, required this.arguments}) : super(key: key);

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
              style: TextStyle(fontSize: 24),
            ),
            // Divider(),
            // Text(
            //   'Last Score is Z',
            //   style: TextStyle(fontSize: 20),
            // ),
            CustomButton(label: 'Home', onPressed: () async {
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
