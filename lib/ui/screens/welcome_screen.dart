import 'package:flutter/material.dart';
import 'package:myapp/W10-Flutter-Lab/lib/ui/quiz_app.dart';
import 'package:myapp/W10-Flutter-Lab/lib/ui/widgets/app_button.dart';

const logoImage = 'images/quiz/quiz-logo.png';

 class WelcomeScreen extends StatelessWidget {
  final Function(QuizScreen) onStartQuiz;

  const WelcomeScreen({super.key, required this.onStartQuiz});
   
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(logoImage, width: 200, height: 200),
        AppButton('Start Quiz', onTap: () => onStartQuiz(QuizScreen.question))
      ],
    );
  }
}
 
