import 'package:flutter/material.dart';
import 'package:workstationmode/components/custom_buttom.dart';

class HomeViews extends StatelessWidget {
  const HomeViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Quizes',),
            Text('select quistion type'),
            CustomButton(label: 'type 1', onPressed:(){} ),
            CustomButton(label: 'type 1', onPressed:(){} ),
            CustomButton(label: 'type 1', onPressed:(){} ),
          ],

        ),
      ),
    );
  }
}
