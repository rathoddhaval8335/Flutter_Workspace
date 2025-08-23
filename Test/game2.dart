import 'dart:async';
import 'package:flutter/material.dart';

class Game2 extends StatefulWidget {
  const Game2({super.key});

  @override
  State<Game2> createState() => _Game2State();
}

class _Game2State extends State<Game2> {
  int _score = 0;
  bool _gameStarted = false;
  late Timer _timer;
  int _timeLeft = 10;

  void _startGame() {
    setState(() {
      _score = 0;
      _timeLeft = 10;
      _gameStarted = true;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft--;
        } else {
          _gameStarted = false;
          _timer.cancel();
          _showScore();
        }
      });
    });
  }

  void _showScore() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("⏱ Time Up! Your Score: $_score")),
    );
  }

  void _tapButton() {
    if (_gameStarted && _timeLeft > 0) {
      setState(() {
        _score++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tap Game")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _gameStarted ? "Time Left: $_timeLeft s" : "Press Start to Play",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "Score: $_score",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _gameStarted ? _tapButton : null,
              child: Text("Tap Button"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _startGame,
              child: Text("Start Game"),
            ),
          ],
        ),
      ),
    );
  }
}
