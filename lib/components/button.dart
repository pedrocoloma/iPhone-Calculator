import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  static const lighterColor = Color.fromRGBO(165, 165, 165, 1);
  static const defaultColor = Color.fromRGBO(51, 51, 51, 1);
  static const orangeColor = Color.fromRGBO(250, 158, 13, 1);
  static const whiteColor = Colors.white;

  final String text;
  final bool isLarge;
  final Color color;
  final Color textColor;
  final bool isSeleccted;
  final void Function(String) callback;

  Button({
    @required this.text,
    this.isLarge = false,
    this.color = defaultColor,
    this.textColor = Colors.white,
    this.isSeleccted = false,
    @required this.callback,
  });

  Button.lighter({
    @required this.text,
    this.isLarge = false,
    this.color = lighterColor,
    this.textColor = Colors.black,
    this.isSeleccted = false,
    @required this.callback,
  });
  Button.large({
    @required this.text,
    this.isLarge = true,
    this.color = defaultColor,
    this.textColor = Colors.white,
    this.isSeleccted = false,
    @required this.callback,
  });

  Button.operation({
    @required this.text,
    this.isLarge = false,
    this.color = orangeColor,
    this.textColor = Colors.white,
    this.isSeleccted = false,
    @required this.callback,
  });

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  Color textColor;
  Color color;

  @override
  Widget build(BuildContext context) {
    this.textColor = widget.textColor;
    this.color = widget.color;

    if (widget.isSeleccted) {
      this.textColor = Button.orangeColor;
      this.color = Button.whiteColor;
    }

    return Expanded(
      flex: widget.isLarge ? 2 : 1,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80.0),
            side: BorderSide(color: Colors.black, width: 4),
          ),
          color: this.color,
          child: Text(
            widget.text,
            style: TextStyle(
              color: textColor,
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: () => widget.callback(widget.text),
        ),
      ),
    );
  }
}
