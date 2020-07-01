import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  
  static const lighterColor = Color.fromRGBO(165, 165, 165, 1);
  static const defaultColor = Color.fromRGBO(51, 51, 51, 1);
  static const orangeColor = Color.fromRGBO(250, 158, 13, 1);

  final String text;
  final bool isLarge;
  final Color color;
  Color textColor = Colors.white;
  final void Function(String) callback;

  Button({
    @required this.text,
    this.isLarge = false,
    this.color = defaultColor,
    @required this.callback,
  });

  Button.lighter({
    @required this.text,
    this.isLarge = false,
    this.color = lighterColor,
    this.textColor = Colors.black,
    @required this.callback,
  });
  Button.large({
    @required this.text,
    this.isLarge = true,
    this.color = defaultColor,
    @required this.callback,
  });

  Button.operation({
    @required this.text,
    this.isLarge = false,
    this.color = orangeColor,
    @required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: isLarge ? 2 : 1,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80.0),
            side: BorderSide(color: Colors.black, width: 4),
          ),
          color: this.color,
          child: Text(
              text,
            style: TextStyle(
              color: textColor,
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: () => callback(text),
        ),
      ),
    );
  }
}
