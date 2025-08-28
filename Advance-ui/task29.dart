/*1.Use a Stack widget to create an overlay effect, where a centered image has a partiallytransparent overlay with some text.*/
import 'package:flutter/material.dart';

class AdvancedUiprg1 extends StatefulWidget {
  const AdvancedUiprg1({super.key});

  @override
  State<AdvancedUiprg1> createState() => _AdvancedUiprg1State();
}

class _AdvancedUiprg1State extends State<AdvancedUiprg1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AdvancednUi Prg1"),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/madhav.jpg",
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            Container(
              width: 400,
              height: 300,
              color: Colors.black.withOpacity(0.4),
            ),
            Text(
                "Hello Flutter",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,),

            ),
          ]

        ),
      ),
    );
  }
}
