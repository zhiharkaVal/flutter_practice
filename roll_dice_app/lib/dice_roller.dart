import 'package:flutter/material.dart';
import 'package:roll_dice_app/styled_text.dart';
import 'dart:math';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = 1;

  void rollDice() {
    setState(() {
      currentDiceRoll = 1 + randomizer.nextInt(6);
    });
  }

  @override
  Widget build(context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/dice-$currentDiceRoll.png",
            width: 250
          ),
          // "Alternative" to margins
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: rollDice,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(180, 34, 69, 57),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: StyledText("Roll the dice!")
          )
        ]
    );
  }
}