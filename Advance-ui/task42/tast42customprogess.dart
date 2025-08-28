import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final double percentage; // Value between 0.0 and 1.0
  final Color backgroundColor;
  final Color progressColor;
  final double height;
  final BorderRadiusGeometry borderRadius;

  const CustomProgressBar({
    Key? key,
    required this.percentage,
    this.backgroundColor = Colors.grey,
    this.progressColor = Colors.blue,
    this.height = 10.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(5.0)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Stack(
        children: [
          Container(
            height: height,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: borderRadius,
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                height: height,
                width: constraints.maxWidth * percentage.clamp(0.0, 1.0),
                decoration: BoxDecoration(
                  color: progressColor,
                  borderRadius: borderRadius,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}