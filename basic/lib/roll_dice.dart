import 'package:flutter/material.dart';
import 'dart:math';

class RollDice extends StatefulWidget {
  const RollDice({super.key});

  @override
  State<RollDice> createState(){
    return _RollDiceState();
  }
}

class _RollDiceState extends State<RollDice> {
  var currentDiceRoll=2;

  void RollDice(){
    setState(() {
      currentDiceRoll=Random().nextInt(6)+1;
    });
    
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/Dice-$currentDiceRoll.png',
          width:200

        ),
        const SizedBox(height:20),
        TextButton(onPressed: RollDice, 
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            fontSize: 28
          )
        ), child: const Text('Roll Dice'))
      ],
    );
  }
}