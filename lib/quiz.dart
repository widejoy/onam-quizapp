import 'package:flutter/material.dart';
import 'package:quiz_app/homepage.dart';
import 'package:quiz_app/models/data.dart';
import 'package:quiz_app/questions.dart';
import 'results.dart';

class Quiz extends StatefulWidget {
  final bool isloading;
  const Quiz({super.key, required this.isloading});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

Widget? screen;

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  void addAnswers(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        screen = Results(
          selectedAnswers,
          Onrestart: restart,
        );
      });
    }
  }

  @override
  void initState() {
    screen = HomePage(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      screen = QustionScreen(addAnswers);
    });
  }

  void restart() {
    setState(() {
      selectedAnswers = [];
      screen = HomePage(switchScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 71, 14, 120),
          ),
          child: screen,
        ),
      ),
    );
  }
}
