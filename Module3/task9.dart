import 'package:flutter/material.dart';

class Task9 extends StatefulWidget {
  const Task9({super.key});

  @override
  State<Task9> createState() => _Task9State();
}

class _Task9State extends State<Task9> {
  TextEditingController txtcontroler = TextEditingController();
  String operator = "";
  double first = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextField(
            controller: txtcontroler,
            enabled: false,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.black),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              showdigit("AC"),
              showdigit("%"),
              showdigit("C"),
              showdigit('÷'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              showdigit("7"),
              showdigit("8"),
              showdigit("9"),
              showdigit("x"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              showdigit("4"),
              showdigit("5"),
              showdigit("6"),
              showdigit("-"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              showdigit("1"),
              showdigit("2"),
              showdigit("3"),
              showdigit("+"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              showdigit("00"),
              showdigit("0"),
              showdigit("."),
              showdigit("="),
            ],
          ),
        ],
      ),
    );
  }

  showdigit(var data) {
    return IconButton(
        onPressed: () {
          onPress(data);
        },
        icon: Text(
          data,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ));
  }

  void onPress(data) {
    if (data == "AC") {
      txtcontroler.text = "";
      first = 0;
      operator = "";
    } else if (data == "C") {
      if (txtcontroler.text.isNotEmpty) {
        txtcontroler.text =
            txtcontroler.text.substring(0, txtcontroler.text.length - 1);
      }
    } else if (data == "+" || data == "-" || data == "x" || data == "÷" || data == "%") {
      first = double.tryParse(txtcontroler.text) ?? 0;
      operator = data;
      txtcontroler.text = "";
    } else if (data == "=") {
      double second = double.tryParse(txtcontroler.text) ?? 0;
      double ans = 0;

      switch (operator) {
        case "+":
          ans = first + second;
          break;
        case "-":
          ans = first - second;
          break;
        case "x":
          ans = first * second;
          break;
        case "÷":
          ans = second != 0 ? first / second : 0;
          break;
        case "%":
          ans = first % second;
          break;
      }

      txtcontroler.text = ans.toString();
      operator = "";
    } else {
      txtcontroler.text += data;
    }
  }
}
