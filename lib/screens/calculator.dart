import 'package:flutter/material.dart';
import 'package:calculator/components/display.dart';
import 'package:calculator/components/keyboard.dart';

class Calculator extends StatelessWidget {

  _onPressed(String text) {
    print(text);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: <Widget>[
          Display('123'),
          Keyboard(_onPressed),
        ],
      ),
    );
  }
}
