import 'package:uuid/uuid.dart';

final uuid = Uuid();

class Question {
  final String id;
  final String title;
  final List<String> choices;
  final String correctChoice;

  Question({String? id, required this.title, required this.choices, required this.correctChoice})
  : id = id ?? uuid.v4() ;
}
