import 'package:flutter/material.dart';

import '../components/custom_button.dart';
import '../utils/question.dart';
import '../utils/questions.dart';

class QuizView extends StatefulWidget {
  const QuizView({Key? key, required this.questionsType}) : super(key: key);

  final String questionsType;

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  int currentQuestionIndex = 0;
  int correctAnswers = 0;

  List<Question> get questions => kQuestions[widget.questionsType]!;

  Question get currentQuestion => questions[currentQuestionIndex];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(widget.questionsType),
          Column(
            children: [
              Text('Question ${currentQuestionIndex + 1}/${questions.length}'),
              Text(currentQuestion.text),
            ],
          ),
          CustomButton(
            label: 'True',
            onPressed: () => submitAnswer(true),
          ),
          CustomButton(label: 'False', onPressed: () => submitAnswer(false)),
        ],
      ),
    );
  }

  void submitAnswer(bool answer) {
    if (answer == currentQuestion.answer) correctAnswers++;

    if (currentQuestionIndex >= questions.length - 1) {
      Navigator.pushNamed(
        context,
        '/results',
        arguments: [correctAnswers, questions.length],
      );
    } else {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }
}
