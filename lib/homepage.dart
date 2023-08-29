import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.switchScreen, {super.key});
  final void Function() switchScreen;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(
          'assets/quiz-logo.png',
          width: 250,
        ),
        const SizedBox(
          height: 60,
        ),
        const Text(
          'Onam Ashamsakal',
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 30,
        ),
        OutlinedButton.icon(
          onPressed: switchScreen,
          label: const Text('start Quiz'),
          icon: const Icon(Icons.arrow_forward),
        )
      ]),
    );
  }
}
