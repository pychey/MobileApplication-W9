import 'package:flutter/material.dart';
import 'package:myapp/W10-Flutter-Lab/lib/model/answer.dart';
import 'package:myapp/W10-Flutter-Lab/lib/model/question.dart';
import 'package:myapp/W10-Flutter-Lab/lib/model/quiz.dart';
import '../ui/screens/welcome_screen.dart';
import '../ui/screens/question_screen.dart';
import '../ui/screens/result_screen.dart';

enum QuizScreen { 
  welcome, 
  question, 
  result
}
 
class QuizApp extends StatefulWidget {
  final Quiz quiz;

  const QuizApp( {super.key, required this.quiz});


  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizScreen currentScreen = QuizScreen.welcome;
  int currentQuestionIndex = 0;
  Quiz get quiz => widget.quiz;
  List<Question> get questions => quiz.questions;
  List<Answer> get answers => quiz.answers;

  void switchScreen(QuizScreen goToScreen) {
    setState(() {
      currentScreen = goToScreen;
    });
  }

  Widget getCurrentScreen() {
    switch (currentScreen) {
      case QuizScreen.welcome:
        return WelcomeScreen(onStartQuiz: switchScreen);
      case QuizScreen.question:
        return QuestionScreen(question: questions[currentQuestionIndex], onSelectAnswer: onSelectAnswer);
      case QuizScreen.result:
        return ResultScreen(quiz: quiz, onRestart: handleOnRestart);
    }
  }

  void onSelectAnswer(String answer, String questionId) {
    quiz.addAnswer(Answer(userChoice: answer, questionId: questionId));
    
    handleNextQuestion();
  }

  void handleNextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex += 1;
      }
      else {
        currentQuestionIndex = 0;
        currentScreen = QuizScreen.result;
      }
    });
  }

  void handleOnRestart() {
    quiz.answers.clear();
    switchScreen(QuizScreen.welcome);
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body:  Center(
          child: getCurrentScreen(),
        ),
      ),
    );
  }
}