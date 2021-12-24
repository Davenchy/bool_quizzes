import 'package:flutter/material.dart';
import 'package:workstationmode/components/custom_buttom.dart';
import 'package:workstationmode/utils/question.dart';
import 'package:workstationmode/utils/questions.dart';
import 'package:workstationmode/views/result.dart';

class SecondView extends StatefulWidget {
  const SecondView({Key? key, required this.questionsType}) : super(key: key);

  final String questionsType;

  @override
  State<SecondView> createState() => _SecondViewState();
}

class _SecondViewState extends State<SecondView> {
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
