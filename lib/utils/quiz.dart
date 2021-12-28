import 'question.dart';

class Quiz {
  const Quiz({
    required this.name,
    required this.questions,
  });

  final String name;
  final List<Question> questions;

  List<Question> getQuestions({bool shuffle = true, int limit = 20}) {
    List<Question> questions = List.from(this.questions);
    if (shuffle) questions.shuffle();

    if (limit > 0 && limit <= questions.length) {
      return questions.sublist(0, limit);
    }

    return questions;
  }
}
