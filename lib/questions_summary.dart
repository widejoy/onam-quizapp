import 'package:flutter/material.dart';

class QustionSummary extends StatelessWidget {
  QustionSummary(this.summary, {super.key});
  List<Map<String, Object>> summary = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map(
            (data) {
              return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                      width: 30,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 150, 198, 241),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        data['index'].toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 22, 2, 56),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          style: const TextStyle(
                              color: Color.fromARGB(255, 44, 138, 196),
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          data['question'] as String,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Center(
                          child: Text(
                              style: const TextStyle(
                                color: Color.fromARGB(255, 128, 14, 215),
                              ),
                              data['user_answer'] as String),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Center(
                          child: Text(
                              style: const TextStyle(
                                color: Color.fromARGB(255, 225, 18, 197),
                              ),
                              data['correct_answer'] as String),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
