import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Opacity(
          opacity: 0.7,
          child: Image.asset(
            'assets/images/two-remove.png',
            width: 300,
            height: 250,
          ),
        ),
        const SizedBox(height: 20.0),
        const Text(
          'Let\'s Test Your Knowledge!',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        const SizedBox(
          height: 30.0,
        ),
        OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Get Started')),
      ],
    ));
  }
}
