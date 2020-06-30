import 'package:flutter/material.dart';
import 'button_row.dart';
import 'button.dart';

class Keyboard extends StatelessWidget {

  final void Function(String) callback;

  Keyboard(this.callback);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        children: <Widget>[
          ButtonRow([
            Button.large(text: 'AC', color: Button.darkColor, callback: callback,),
            Button(text: '%', color: Button.darkColor, callback: callback,),
            Button.operation(text: '/', callback: callback,),
          ]),
          ButtonRow([
            Button(text: '7', callback: callback,),
            Button(text: '8', callback: callback,),
            Button(text: '9', callback: callback,),
            Button.operation(text: 'X', callback: callback,),
          ]),
          ButtonRow([
            Button(text: '4', callback: callback,),
            Button(text: '5', callback: callback,),
            Button(text: '6', callback: callback,),
            Button.operation(text: '-', callback: callback,),
          ]),
          ButtonRow([
            Button(text: '1', callback: callback,),
            Button(text: '2', callback: callback,),
            Button(text: '3', callback: callback,),
            Button.operation(text: '+', callback: callback,),
          ]),
          ButtonRow([
            Button.large(text: '0', callback: callback,),
            Button(text: ',', callback: callback,),
            Button.operation(text: '=',  callback: callback,),
          ]),
        ],
      ),
    );
  }
}