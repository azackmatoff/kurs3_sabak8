import 'package:flutter/material.dart';
import 'package:kurs3_sabak8/app/app_constants/app_constants.dart';

class AppTextStyles {
  static const kTempTextStyle = TextStyle(
    fontFamily: 'Spartan MB',
    fontSize: 100.0,
  );

  static const kMessageTextStyle = TextStyle(
    fontFamily: 'Spartan MB',
    fontSize: 60.0,
  );

  static const kButtonTextStyle = TextStyle(
    fontSize: 30.0,
    fontFamily: 'Spartan MB',
  );

  static const kConditionTextStyle = TextStyle(
    fontSize: 100.0,
  );

  static const kTextFieldInputDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    icon: Icon(
      Icons.location_city,
      color: Colors.white,
    ),
    hintText: AppConstants.enterCityName,
    hintStyle: TextStyle(
      color: Colors.grey,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
      borderSide: BorderSide.none,
    ),
  );
}
