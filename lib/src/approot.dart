import 'package:flutter/material.dart';
import 'package:workstationmode/components/custom_buttom.dart';
import 'package:workstationmode/views/first_view.dart';

class AppRoot extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: HomeViews(),
    );
  }
}
