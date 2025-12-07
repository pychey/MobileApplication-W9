import 'package:flutter/material.dart';
import 'package:myapp/W10-Flutter-Lab/lib/model/question.dart';
import 'package:myapp/W10-Flutter-Lab/lib/ui/widgets/app_button.dart';
 
class QuestionScreen extends StatelessWidget {
  final Question question;
  final Function(String, String) onSelectAnswer;

  const QuestionScreen({super.key, required this.question, required this.onSelectAnswer});

  Widget answerChoicesBuilder (BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.only(right:40, left: 40, bottom: 40),
      child: AppButton(question.choices[index], onTap: () => onSelectAnswer(question.choices[index], question.id)));
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: Text(question.title, style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: question.choices.length, 
          itemBuilder: answerChoicesBuilder
        )
      ],
    );
  }
}
 