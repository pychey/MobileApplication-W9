import 'package:flutter/material.dart';
import 'package:myapp/W10-Flutter-Lab/lib/model/answer.dart';
import 'package:myapp/W10-Flutter-Lab/lib/model/question.dart';
import 'package:myapp/W10-Flutter-Lab/lib/model/quiz.dart';
import 'package:myapp/W10-Flutter-Lab/lib/ui/widgets/app_button.dart';

class ResultScreen extends StatelessWidget {
  final Quiz quiz;
  final VoidCallback onRestart;
  int get totalQuestion => quiz.questions.length;
  int get correctQuestion => quiz.getScore();

  const ResultScreen({super.key, required this.quiz, required this.onRestart});

  Widget resultBuilder (BuildContext context, int index) {
    return ResultItem(questionIndex: index, question: quiz.questions[index], answer: quiz.answers[index], isCorrect: quiz.answers[index].isCorrect(quiz));
  }
   
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Text('YOU ANSWERED $correctQuestion ON $totalQuestion', style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: quiz.questions.length,
            itemBuilder: resultBuilder
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: AppButton('Restart Quiz', onTap: onRestart),
          )
        ],
      ),
    );
  }
}

class ResultItem extends StatelessWidget {
  final Question question;
  final Answer answer;
  final int questionIndex;
  final bool isCorrect;
  Color get resultColor => isCorrect ? Colors.green : Colors.red;
  TextStyle get textStyle => TextStyle(color: Colors.white, fontSize: 16);

  const ResultItem({
    super.key,
    required this.question,
    required this.answer, 
    required this.questionIndex, 
    required this.isCorrect
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right:40, left: 40, bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(backgroundColor: resultColor, foregroundColor: Colors.white, child: Text('${questionIndex + 1}')),
              SizedBox(width: 10), 
              Text(question.title, style: textStyle)
            ]
          ),
          SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            itemCount: question.choices.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    SizedBox(width: 50, child: question.choices[index] == question.correctChoice ? Icon(Icons.check, color: Colors.white) : null), 
                    Text(question.choices[index], style: answer.userChoice == question.choices[index] ? TextStyle(color: resultColor, fontSize: 16): textStyle)
                  ]),
              );
            }
          )
        ],
      )
    );
  }
}
 