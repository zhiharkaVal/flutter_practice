import 'package:flutter/material.dart';
import 'package:quiz_app/gradient_container.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          Color.fromARGB(180, 9, 111, 131),
          Color.fromARGB(120, 90, 212, 236)
        ),
      ),
    ),
  );
}
