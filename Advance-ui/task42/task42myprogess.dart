import 'package:flutter/material.dart';

import 'tast42customprogess.dart';

class MyProgressScreen extends StatefulWidget {
  const MyProgressScreen({Key? key}) : super(key: key);

  @override
  State<MyProgressScreen> createState() => _MyProgressScreenState();
}

class _MyProgressScreenState extends State<MyProgressScreen> {
  double _currentProgress = 0.2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Progress Bar')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomProgressBar(
                percentage: _currentProgress,
                height: 15.0,
                progressColor: Colors.green,
                backgroundColor: Colors.green.shade100,
              ),
              const SizedBox(height: 20),
              Text(
                'Progress: ${(_currentProgress * 100).toStringAsFixed(0)}%',
                style: const TextStyle(fontSize: 18),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _currentProgress = (_currentProgress + 0.1).clamp(0.0, 1.0);
                  });
                },
                child: const Text('Increase Progress'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}