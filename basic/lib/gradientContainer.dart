import 'package:flutter/material.dart';
import 'package:udemy_study/rollDice.dart';

const aligntop = Alignment.topLeft;
const alignbottom = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  // const GradientContainer (this.color1,this.color2,{super.key});

  GradientContainer.purple({super.key})
      : color1 = const Color.fromARGB(255, 66, 165, 245),
        color2 = const Color.fromARGB(255, 76, 163, 234);

  final Color color1;
  final Color color2;

  

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [color1, color2], begin: aligntop, end: alignbottom),
      ),
      child: Center(
        child: RollDice(),
      ),
    );
  }
}
