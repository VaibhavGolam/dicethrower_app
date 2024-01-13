import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

//variable
final random = Random();
var currentDiceRoll = 2;

int randomNum = 1;
late ShakeDetector detector;

class _DiceRollerState extends State<DiceRoller> {
  //rolling dice when clicked
  void rollDice() {
    setState(() {
      currentDiceRoll = random.nextInt(6) +
          1; // Generates a random number between 1 and 6 WHEN CLICKED
    });
  }

  @override
  void initState() {
    super.initState();

    //rolling dice when shaked
    detector = ShakeDetector.autoStart(onPhoneShake: () {
      setState(() {
        currentDiceRoll = random.nextInt(6) +
            1; // Generates a random number between 1 and 6 WHEN PHONE SHAKED
      });
    });
  }

  @override
  void dispose() {
    detector.stopListening();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Shake device or click button',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 222, 189, 89),
          ),
        ),

        const SizedBox(
          height: 30,
        ),

        //dice
        Image.asset(
          'assets/images/dice-$currentDiceRoll.png',
          width: 200,
        ),

        const SizedBox(
          height: 30,
        ),

        //rolling button
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 222, 189, 89),
            foregroundColor: Colors.black,
          ),
          onPressed: rollDice,
          child: const Text(
            'Roll dice',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
