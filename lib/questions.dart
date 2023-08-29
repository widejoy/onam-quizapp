import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/models/data.dart';

class QustionScreen extends StatefulWidget {
  const QustionScreen(this.addAnswers, {super.key});
  final void Function(String answer) addAnswers;

  @override
  State<QustionScreen> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QustionScreen> {
  var currentQuestionIndex = 0;
  void onTap(String answer) {
    widget.addAnswers(answer);

    setState(
      () {
        currentQuestionIndex++;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];

    return Container(
      margin: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(
                  color: Color.fromARGB(255, 210, 102, 237), fontSize: 22),
            ),
            const SizedBox(
              height: 30,
              width: 10,
            ),
            ...currentQuestion.ShuffledAnswers().map(
              (answer) {
                return ButtomStyle(answer, (() => {onTap(answer)}));
              },
            )
          ],
        ),
      ),
    );
  }
}
