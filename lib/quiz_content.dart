import 'package:flutter/material.dart';
import 'constants.dart';

class QuizContent extends StatelessWidget {
  final int quizNumber;
  final String quizContent;

  QuizContent({this.quizNumber, this.quizContent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // question number
          Text(
            'Quiz no.$quizNumber',
            style: kGeneralTextStyle,
          ),

          // sized box for padding
          SizedBox(
            height: 40.0,
          ),

          // question
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              quizContent,
              style: kGeneralTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
