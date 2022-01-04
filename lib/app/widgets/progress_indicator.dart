import 'package:flutter/material.dart';

circularProgress() {
  return Center(
    child: CircularProgressIndicator(
      backgroundColor: Colors.amberAccent,
      color: Colors.white,
    ),
  );
}

linearProgress() {
  return SafeArea(
    child: LinearProgressIndicator(
      backgroundColor: Colors.amberAccent,
      color: Colors.white,
    ),
  );
}
