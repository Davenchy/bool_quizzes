import 'package:flutter/material.dart';

import 'results_view.dart';
import '../utils/question.dart';
import '../components/custom_button.dart';
import 'view_arguments/quiz_view_arguments.dart';
import 'view_arguments/results_view_arguments.dart';

class QuizView extends StatefulWidget {
  const QuizView({Key? key, required this.args}) : super(key: key);

  static const String routeName = '/quiz';

  final QuizViewArguments args;

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView>
    with SingleTickerProviderStateMixin {
  int currentQuestionIndex = 0;
  int correctAnswers = 0;

  late final List<Question> questions;

  String get quizName => widget.args.quiz.name;
  int get questionsLength => questions.length;
  Question get currentQuestion => questions[currentQuestionIndex];

  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    questions = widget.args.quiz.getQuestions();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final String title = '$quizName Quiz';
    final String subtitle = '${currentQuestionIndex + 1}/$questionsLength';

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              height: size.height * 0.3,
              alignment: Alignment.center,
              child: Text(
                currentQuestion.text,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  CustomButton(
                    label: 'True',
                    onPressed: () => submitAnswer(true),
                  ),
                  const SizedBox(height: 32),
                  CustomButton(
                    label: 'False',
                    onPressed: () => submitAnswer(false),
                  ),
                ],
              ),
            ),
            AnimatedBuilder(
              animation: controller,
              builder: (context, _) {
                return LinearProgressIndicator(
                  minHeight: 16.0,
                  value: controller.value,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void submitAnswer(bool answer) {
    if (answer == currentQuestion.answer) correctAnswers++;

    if (currentQuestionIndex == questions.length - 1) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.popAndPushNamed(
          context,
          ResultsView.routeName,
          arguments: ResultsViewArguments(
            quiz: widget.args.quiz,
            correctAnswers: correctAnswers,
          ),
        );
      });

      currentQuestionIndex++;
    } else if (currentQuestionIndex < questions.length - 1) {
      setState(() => currentQuestionIndex++);
    }

    controller.animateTo(
      currentQuestionIndex / questionsLength,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
