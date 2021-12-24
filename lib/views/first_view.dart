import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workstationmode/components/custom_buttom.dart';
import 'package:workstationmode/views/sec_view.dart';

class HomeViews extends StatelessWidget {
  const HomeViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              'Quizes',
            ),
            Text('select quistion type'),
            FutureBuilder<SharedPreferences>(
              future: SharedPreferences.getInstance(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final double? score = snapshot.data!.getDouble('score');

                  if (score == null) {
                    return Container();
                  } else {
                    return Text('latest score is ${score * 100}%');
                  }
                }
                return Container();
              },
            ),
            CustomButton(
                label: 'type 1', onPressed: () => start(context, 'type1')),
            CustomButton(
                label: 'type 2', onPressed: () => start(context, 'type1')),
            CustomButton(
                label: 'type 3', onPressed: () => start(context, 'type1')),
          ],
        ),
      ),
    );
  }

  start(BuildContext context, String type) {
    Navigator.pushNamed(context, '/questions', arguments: type);
  }
}
