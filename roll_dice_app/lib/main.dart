import 'package:flutter/material.dart';
import 'package:roll_dice_app/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          Color.fromARGB(180, 34, 69, 57),
          Color.fromARGB(130, 34, 69, 57)
        ),
      ),
    ),
  );
}
