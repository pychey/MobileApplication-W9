import 'package:myapp/W10-Flutter-Lab/lib/model/question.dart';
import 'package:myapp/W10-Flutter-Lab/lib/model/quiz.dart';

Quiz quiz = Quiz(
  questions: [
    Question(
      title: 'WHO IS THE BEST TEACHER ?', 
      choices: ['Ronan', 'Hongly', 'Leangsiv'], 
      correctChoice: 'Ronan'
    ),
    Question(
      title: 'WHAT IS THE BEST COLOR ?', 
      choices: ['Blue', 'Green', 'Red'], 
      correctChoice: 'Blue'
    ),
  ]
);