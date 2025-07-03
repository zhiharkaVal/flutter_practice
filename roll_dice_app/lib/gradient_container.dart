import 'package:flutter/material.dart';
import 'dice_roller.dart';

class GradientContainer extends StatelessWidget {
  final Color gradientStartColor;
  final Color gradientEndColor;
  // This is a constructor function
  const GradientContainer(this.gradientStartColor, this.gradientEndColor, {super.key});

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            gradientStartColor,
            gradientEndColor
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Center(
        child: DiceRoller()
      ),
    );
  }
}