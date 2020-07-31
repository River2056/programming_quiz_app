import 'package:flutter/material.dart';
import 'reuseable_card.dart';
import 'quiz_content.dart';
import 'choice.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

enum Decision { A, B, C, D }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Decision decision;
  List<bool> scoreKeeper = [];

  List<Widget> get scoreIcons =>
      scoreKeeper.map((e) => formatIntoIcon(e)).toList();

  Widget formatIntoIcon(bool answer) {
    return answer
        ? Icon(
            Icons.check,
            color: Colors.green,
          )
        : Icon(
            Icons.close,
            color: Colors.red,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Programming Quiz',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // quiz area
          ReuseableCard(
            color: kCardBackgroundColorLight,
            flexSize: 6,
            cardChild: QuizContent(
              quizNumber: 1,
              quizContent:
                  'How do you print Hello World to the console in Python?',
            ),
          ),

          // score area
          Row(
            children: scoreIcons,
          ),

          // choices area
          ReuseableCard(
            color: decision == Decision.A
                ? kCardBackgroundColorLight
                : kCardBackgroundColor,
            flexSize: 1,
            cardChild: Choice(
              choice: 'A.',
              answer: 'print(\'Hello World!\')',
              checked: decision == Decision.A,
            ),
            cardFunction: () {
              setState(() {
                decision = Decision.A;
              });
            },
          ),
          ReuseableCard(
            color: decision == Decision.B
                ? kCardBackgroundColorLight
                : kCardBackgroundColor,
            flexSize: 1,
            cardChild: Choice(
              choice: 'B.',
              answer: 'Print(Hello World!)',
              checked: decision == Decision.B,
            ),
            cardFunction: () {
              setState(() {
                decision = Decision.B;
              });
            },
          ),
          ReuseableCard(
            color: decision == Decision.C
                ? kCardBackgroundColorLight
                : kCardBackgroundColor,
            flexSize: 1,
            cardChild: Choice(
              choice: 'C.',
              answer: 'print Hello World!',
              checked: decision == Decision.C,
            ),
            cardFunction: () {
              setState(() {
                decision = Decision.C;
              });
            },
          ),
          ReuseableCard(
            color: decision == Decision.D
                ? kCardBackgroundColorLight
                : kCardBackgroundColor,
            flexSize: 1,
            cardChild: Choice(
              choice: 'D.',
              answer: 'print(\'Hello World!\")',
              checked: decision == Decision.D,
            ),
            cardFunction: () {
              setState(() {
                decision = Decision.D;
              });
            },
          ),
          ReuseableCard(
            color: Colors.green,
            flexSize: 1,
            cardChild: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Next Question',
                  style: kGeneralTextStyle,
                ),
                Icon(
                  Icons.chevron_right,
                )
              ],
            ),
            cardFunction: () {},
          ),
        ],
      ),
    );
  }
}
