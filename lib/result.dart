import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function reset;

  Result(this.score, this.reset);

  String get resultPhrase {
    String resultText;
    if (score <= 8) {
      resultText = 'you suck';
    } else if (score <= 12) {
      resultText = 'you suck less';
    } else if (score <= 16) {
      resultText = 'you suck way less';
    } else {
      resultText = 'go kill yourself';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        Center(
          child: RaisedButton(
            color: Colors.orange,
            child: Text('retry'),
            textColor: Colors.white,
            onPressed: reset,
          )
        )
      ],
    );
  }
}
