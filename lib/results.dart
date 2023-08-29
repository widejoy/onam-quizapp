import 'package:flutter/material.dart';
import 'package:quiz_app/models/data.dart';
import 'package:quiz_app/questions_summary.dart';

class Results extends StatelessWidget {
  Results(this.chosenAnswers, {super.key, required this.Onrestart});
  List<String> chosenAnswers = [];
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }

    return summary;
  }

  final void Function() Onrestart;

  @override
  Widget build(BuildContext context) {
    var score = 0;
    var totalscore = chosenAnswers.length;
    for (var i = 0; i < chosenAnswers.length; i++) {
      if (chosenAnswers[i] == questions[i].answers[0]) {
        score++;
      }
    }
    score.toString();
    totalscore.toString();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You have answered $score out of $totalscore!',
            style: const TextStyle(
              fontSize: 30,
              color: Color.fromARGB(255, 210, 102, 237),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          QustionSummary(getSummaryData()),
          const SizedBox(
            height: 20,
          ),
          TextButton.icon(
            onPressed: Onrestart,
            label: const Text('restart quiz'),
            icon: const Icon(Icons.autorenew_rounded,
                color: Color.fromARGB(255, 48, 13, 103)),
          )
        ],
      ),
    );
  }
}
