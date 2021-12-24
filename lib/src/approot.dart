import 'package:flutter/material.dart';
import 'package:workstationmode/components/custom_buttom.dart';
import 'package:workstationmode/views/first_view.dart';
import 'package:workstationmode/views/result.dart';
import 'package:workstationmode/views/sec_view.dart';

class AppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => HomeViews(),
            );
          case '/questions':
            return MaterialPageRoute(
              builder: (context) => SecondView(
                questionsType: settings.arguments as String,
              ),
            );
          case '/results':
            return MaterialPageRoute(
              builder: (context) => Result(
                arguments: settings.arguments as List<int>,
              ),
            );
        }
      },
    );
  }
}
