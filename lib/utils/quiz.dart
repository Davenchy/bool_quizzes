import 'question.dart';

class Quiz {
  const Quiz({
    required this.name,
    required this.questions,
  });

  final String name;
  final List<Question> questions;
}
