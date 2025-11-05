import 'package:flutter/material.dart';


class Task3LoadingAnimation extends StatefulWidget {
  const Task3LoadingAnimation({super.key});

  @override
  State<Task3LoadingAnimation> createState() => _Task3LoadingAnimationState();
}

class _Task3LoadingAnimationState extends State<Task3LoadingAnimation> {
  bool _isLoading = true;
  String _data = '';

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    await Future.delayed(const Duration(seconds: 3)); // Simulate network delay
    setState(() {
      _data = 'Data successfully loaded!';
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data Fetch Example')),
      body: Center(
        child: _isLoading
            ? const LoadingAnimation() // Show loading animation
            : Text(
          _data,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({super.key});

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.7, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.cloud_download, size: 60, color: Colors.blue),
          const SizedBox(height: 16),
          Text(
            'Fetching data...',
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
