import 'package:myapp/W10-Flutter-Lab/lib/model/answer.dart';
import 'package:myapp/W10-Flutter-Lab/lib/model/question.dart';

class Quiz {
  final List<Question> questions;
  final List<Answer> answers;

  Quiz({required this.questions, List<Answer>? answers})
  : answers = answers ?? [];

  void addAnswer(Answer answer) {
    answers.add(answer);
  }

  int getScore() {
    return answers.where((answer) => getQuestionById(answer.questionId).correctChoice == answer.userChoice).length;
  }

  Question getQuestionById (String questionId) {
    return questions.firstWhere((question) => question.id == questionId);
  }
}