import 'package:flutter/material.dart';
class Task1AnimationButton extends StatefulWidget {
  const Task1AnimationButton({super.key});

  @override
  State<Task1AnimationButton> createState() => _Task1AnimationButtonState();
}

class _Task1AnimationButtonState extends State<Task1AnimationButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: GestureDetector(
          onTapDown: (_) {
            setState(() => _isPressed = true);
          },
          onTapUp: (_) {
            setState(() => _isPressed = false);
          },
          onTapCancel: () {
            setState(() => _isPressed = false);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: _isPressed ? 180 : 200,
            height: _isPressed ? 55 : 60,
            decoration: BoxDecoration(
              color: _isPressed ? Colors.blueAccent : Colors.blue,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                if (!_isPressed)
                  const BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 6),
                    blurRadius: 10,
                  ),
              ],
            ),
            alignment: Alignment.center,
            child: Text(
              _isPressed ? 'Pressed!' : 'Press Me',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
