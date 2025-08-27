import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Game")),
      body: const Center(
        child: Text(
          "Here will be your interactive game 🎮",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
