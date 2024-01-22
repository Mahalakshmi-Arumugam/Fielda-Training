
import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key,required this.chooseAnswer});

  final List<String>chooseAnswer;

  List<Map<String,Object>>getSummaryData(){
    final List<Map<String,Object>>summary=[];

    for (var i=0;i<chooseAnswer.length;i++){
      summary.add({
        'question_index': i,
        'question':questions[i].text,
        'correct_answer':questions[i].answers[0],
        'user_answer':chooseAnswer[i]
      });

    }
    return summary;

  }

  
  @override
  Widget build(BuildContext context) {
    final summaryData=getSummaryData();
    final numTotalQuestions =questions.length;
    final numCorrectQuestions=summaryData.where((data){
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(70),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Text('You answered $numCorrectQuestions out of $numTotalQuestions questions'),
            const SizedBox(height: 30,),
            QuestionSummary(summaryData),
            const SizedBox(height: 30,),
            TextButton(onPressed: (){}, child:const Text('Restart Quiz!'),)
          ]),
      ),
    );
  }
}