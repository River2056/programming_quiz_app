import 'package:flutter/material.dart';
import 'constants.dart';

class Choice extends StatelessWidget {
  final String choice;
  final String answer;
  final bool checked;

  Choice({this.choice, this.answer, this.checked});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        choice,
        style: kGeneralTextStyle,
      ),
      title: Text(
        answer,
        style: kGeneralTextStyle,
      ),
      trailing: checked ? Icon(Icons.check) : null,
    );
  }
}
