import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText({super.key});

  @override
  Widget build(context) {
    return const Text(
      'Welcome to Dice Roller app!',
      style: TextStyle(fontSize: 25),
    );
  }
}