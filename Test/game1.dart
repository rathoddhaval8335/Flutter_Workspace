import 'dart:math';
import 'package:flutter/material.dart';

class Game1 extends StatefulWidget {
  const Game1({super.key});

  @override
  State<Game1> createState() => _Game1State();
}

class _Game1State extends State<Game1> {
  final Random _random = Random();
  final TextEditingController _controller = TextEditingController();
  int _randomNumber = 0;
  int _attempts = 0;
  final int _maxAttempts = 5;

  @override
  void initState() {
    super.initState();
    _generateRandomNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Guess Game")),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Any Number"),
            ),
            SizedBox(height: 10),
            Text(
              "Attempts: $_attempts / $_maxAttempts",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: (_attempts < _maxAttempts) ? _checkNumber : null,
              child: Text("Check Number"),
            ),
          ],
        ),
      ),
    );
  }

  void _generateRandomNumber() {
    setState(() {
      _randomNumber = _random.nextInt(15);
      _attempts = 0;
    });
  }

  void _checkNumber() {
    if (_controller.text.isEmpty) return;

    setState(() {
      _attempts++;
    });

    int enteredNumber = int.parse(_controller.text);
    String msg = "";

    if (enteredNumber > _randomNumber) {
      msg = "Number is Bigger!";
    } else if (enteredNumber < _randomNumber) {
      msg = "Number is Lower!";
    } else {
      msg = "Correct! You Winner ";
    }

    if (_attempts >= _maxAttempts && enteredNumber != _randomNumber) {
      msg = "Game Over! Correct Number was $_randomNumber\n\nGame Restarted!";
      _generateRandomNumber();
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), duration: Duration(seconds: 2)),
    );
  }
}
