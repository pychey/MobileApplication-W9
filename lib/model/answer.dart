import 'package:myapp/W10-Flutter-Lab/lib/model/quiz.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();

class Answer {
  final String id;
  final String userChoice;
  final String questionId;

  Answer({String? id, required this.userChoice, required this.questionId})
  : id = id ?? uuid.v4();

  bool isCorrect(Quiz quiz) {
    return userChoice == quiz.getQuestionById(questionId).correctChoice;
  }
}