import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/getStarted.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> _selectedAnswers = [];
  var activeScreen = 'GetStarted';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if(_selectedAnswers.length==questions.length){
      setState(() {
        activeScreen='results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = GetStarted(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if(activeScreen=='results-screen'){
      screenWidget = ResultScreen(chooseAnswer:_selectedAnswers,);
    }
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(4, 56, 115, 1),
                Color.fromRGBO(0, 85, 255, 1),
              ],
            ),
          ),
          child: screenWidget,
        )));
  }
}
