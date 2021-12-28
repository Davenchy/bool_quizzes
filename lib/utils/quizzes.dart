import 'quiz.dart';
import 'question.dart';

const List<Quiz> kQuizzes = [
  Quiz(
    name: 'Quiz1',
    questions: [
      Question(text: 'this is question 1', answer: true),
      Question(text: 'this is question 2', answer: true),
    ],
  ),
];
