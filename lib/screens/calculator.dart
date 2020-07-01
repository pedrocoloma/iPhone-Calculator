import 'package:flutter/material.dart';
import 'package:calculator/components/display.dart';
import 'package:calculator/components/keyboard.dart';
import 'package:calculator/models/Brain.dart';
import 'package:flutter/services.dart';

class Calculator extends StatefulWidget {

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final Brain brain = Brain();

  _onPressed(String command) {
    setState(() {
      brain.applyCommand(command);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);

    return MaterialApp(
      home: Column(
        children: <Widget>[
          Display(brain.value),
          Keyboard(_onPressed),
        ],
      ),
    );
  }
}
