import '../../utils/quiz.dart';

class ResultsViewArguments {
  const ResultsViewArguments({
    required this.quiz,
    required this.correctAnswers,
  });

  final Quiz quiz;
  final int correctAnswers;
}
