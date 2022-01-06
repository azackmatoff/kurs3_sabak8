import 'package:flutter/material.dart';
import 'package:kurs3_sabak8/app/app_constants/app_constants.dart';

import 'package:kurs3_sabak8/app/views/city_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appTitle,
      theme: ThemeData.dark(),
      home: CityView(),
    );
  }
}
