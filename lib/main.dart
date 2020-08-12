import 'package:flutter/material.dart';
import 'package:program_quiz_app/quiz_center.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
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
      title: 'Programming Quiz',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

QuizCenter quizCenter = QuizCenter();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Decision decision;
  List<bool> scoreKeeper = [];
  int score = 0;

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
  void initState() {
    super.initState();
    quizCenter.shuffleList();
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
              quizNumber: quizCenter.getQuizNumber(),
              quizContent: quizCenter.getQuizQuestion(),
            ),
          ),

          // score area
          Row(
            children: scoreIcons.length == 0
                ? [
                    SizedBox(
                      height: 30.0,
                    )
                  ]
                : scoreIcons,
          ),

          // choices area
          ReuseableCard(
            color: decision == Decision.A
                ? kCardBackgroundColorLight
                : kCardBackgroundColor,
            flexSize: 1,
            cardChild: Choice(
              choice: 'A.',
              answer: quizCenter.getQuizChoices()[0],
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
              answer: quizCenter.getQuizChoices()[1],
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
              answer: quizCenter.getQuizChoices()[2],
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
              answer: quizCenter.getQuizChoices()[3],
              checked: decision == Decision.D,
            ),
            cardFunction: () {
              setState(() {
                decision = Decision.D;
              });
            },
          ),
          ReuseableCard(
            color: quizCenter.checkEndGame() ? Colors.red : Colors.green,
            flexSize: 1,
            cardChild: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  quizCenter.checkEndGame() ? 'Restart' : 'Next Question',
                  style: kGeneralTextStyle,
                ),
                Icon(
                  Icons.chevron_right,
                )
              ],
            ),
            cardFunction: () => confirmBtnFunction(),
          ),
        ],
      ),
    );
  }

  bool checkForAnswer(Decision decision, Decision userInput) {
    return decision == userInput;
  }

  void confirmBtnFunction() {
    if (!quizCenter.checkEndGame()) {
      Decision quizAnswer = quizCenter.getAnswer();
      bool ans = checkForAnswer(decision, quizAnswer);
      setState(() {
        scoreKeeper.add(ans);
        score += ans ? 10 : 0;
        quizCenter.nextQuestion();
        decision = null;
        if (quizCenter.checkEndGame()) {
          Alert(
            context: context,
            type: AlertType.success,
            style: AlertStyle(
              backgroundColor: Colors.white,
            ),
            title: "GAME OVER",
            desc: "Your final score is: $score",
            buttons: [
              DialogButton(
                child: Text(
                  "Restart",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  setState(() {
                    quizCenter.resetGame();
                    scoreKeeper = [];
                    score = 0;
                    Navigator.pop(context);
                  });
                },
                width: 120,
              )
            ],
            closeFunction: () {},
          ).show();
        }
      });
    } else {
      setState(() {
        quizCenter.resetGame();
        scoreKeeper = [];
        score = 0;
      });
    }
  }
}
