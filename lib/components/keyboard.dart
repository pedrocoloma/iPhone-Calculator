import 'package:flutter/material.dart';
import 'button_row.dart';
import 'button.dart';

class Keyboard extends StatelessWidget {
  final void Function(String) callback;
  final String _selectedOperation;

  Keyboard(this.callback, this._selectedOperation);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: Column(
        children: <Widget>[
          ButtonRow([
            Button.lighter(
              text: 'C',
              callback: callback,
            ),
            Button.lighter(
              text: '+/-',
              callback: callback,
            ),
            Button.lighter(
              text: '%',
              callback: callback,
            ),
            Button.operation(
              text: '/',
              isSeleccted: '/' == _selectedOperation,
              callback: callback,
            ),
          ]),
          ButtonRow([
            Button(
              text: '7',
              callback: callback,
            ),
            Button(
              text: '8',
              callback: callback,
            ),
            Button(
              text: '9',
              callback: callback,
            ),
            Button.operation(
              text: 'x',
              isSeleccted: 'x' == _selectedOperation,
              callback: callback,
            ),
          ]),
          ButtonRow([
            Button(
              text: '4',
              callback: callback,
            ),
            Button(
              text: '5',
              callback: callback,
            ),
            Button(
              text: '6',
              callback: callback,
            ),
            Button.operation(
              text: '-',
              isSeleccted: '-' == _selectedOperation,
              callback: callback,
            ),
          ]),
          ButtonRow([
            Button(
              text: '1',
              callback: callback,
            ),
            Button(
              text: '2',
              callback: callback,
            ),
            Button(
              text: '3',
              callback: callback,
            ),
            Button.operation(
              text: '+',
              isSeleccted: '+' == _selectedOperation,
              callback: callback,
            ),
          ]),
          ButtonRow([
            Button.large(
              text: '0',
              callback: callback,
            ),
            Button(
              text: '.',
              callback: callback,
            ),
            Button.operation(
              text: '=',
              callback: callback,
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
