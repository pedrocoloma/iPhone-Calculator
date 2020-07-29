import 'package:flutter/material.dart';
import 'button_row.dart';
import 'button.dart';

class Keyboard extends StatefulWidget {
  final void Function(String) callback;
  final String _selectedOperation;

  Keyboard(this.callback, this._selectedOperation);

  @override
  _KeyboardState createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: Column(
        children: <Widget>[
          ButtonRow([
            Button.lighter(
              text: 'C',
              callback: widget.callback,
            ),
            Button.lighter(
              text: '+/-',
              callback: widget.callback,
            ),
            Button.lighter(
              text: '%',
              callback: widget.callback,
            ),
            Button.operation(
              text: '/',
              isSeleccted: '/' == widget._selectedOperation,
              callback: widget.callback,
            ),
          ]),
          ButtonRow([
            Button(
              text: '7',
              callback: widget.callback,
            ),
            Button(
              text: '8',
              callback: widget.callback,
            ),
            Button(
              text: '9',
              callback: widget.callback,
            ),
            Button.operation(
              text: 'x',
              isSeleccted: 'x' == widget._selectedOperation,
              callback: widget.callback,
            ),
          ]),
          ButtonRow([
            Button(
              text: '4',
              callback: widget.callback,
            ),
            Button(
              text: '5',
              callback: widget.callback,
            ),
            Button(
              text: '6',
              callback: widget.callback,
            ),
            Button.operation(
              text: '-',
              isSeleccted: '-' == widget._selectedOperation,
              callback: widget.callback,
            ),
          ]),
          ButtonRow([
            Button(
              text: '1',
              callback: widget.callback,
            ),
            Button(
              text: '2',
              callback: widget.callback,
            ),
            Button(
              text: '3',
              callback: widget.callback,
            ),
            Button.operation(
              text: '+',
              isSeleccted: '+' == widget._selectedOperation,
              callback: widget.callback,
            ),
          ]),
          ButtonRow([
            Button.large(
              text: '0',
              callback: widget.callback,
            ),
            Button(
              text: '.',
              callback: widget.callback,
            ),
            Button.operation(
              text: '=',
              callback: widget.callback,
            ),
          ]),
          SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
