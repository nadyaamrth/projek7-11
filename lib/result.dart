import 'dart:ui';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText = 'you did it';
    if (resultScore <= 8) {
      resultText = "Cool";
    } else if (resultScore <= 16) {
      resultText = "Lumayan";
    } else if (resultScore <= 20) {
      resultText = "Cukup";
    } else {
      resultText = "Kurang";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text("Restart Quiz"),
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
