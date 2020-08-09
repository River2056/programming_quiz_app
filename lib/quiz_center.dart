import 'quiz.dart';
import 'constants.dart';

class QuizCenter {
  int quizNo = 0;
  bool gameEnded = false;
  List<Quiz> quizList = [
    Quiz(
      quizNumber: 1,
      quizContent: 'How do you print Hello World to the console in Python?',
      choices: [
        'print(\'Hello World!\')',
        'Print(Hello World!)',
        'print Hello World!',
        'print(\'Hello World!\")',
      ],
      answer: Decision.A,
    ),
    Quiz(
      quizNumber: 2,
      quizContent:
          'How do you print the string \'something\' to the JavaScript console in the browser?',
      choices: [
        'print(\'something\')',
        'console.log(\'something\')',
        'print something',
        'System.out.println(\'something\')',
      ],
      answer: Decision.B,
    ),
    Quiz(
        quizNumber: 3,
        quizContent:
            'What is the output of the below code? \n print(\'1\' + 1)',
        choices: [
          '2',
          '\'2\'',
          '11',
          '\'11\'',
        ],
        answer: Decision.C),
  ];

  int getQuizNo() {
    return quizNo;
  }

  int getQuizNumber() {
    return this.quizList[quizNo].quizNumber;
  }

  String getQuizQuestion() {
    return this.quizList[quizNo].quizContent;
  }

  List<String> getQuizChoices() {
    return this.quizList[quizNo].choices;
  }

  Decision getAnswer() {
    return this.quizList[quizNo].answer;
  }

  void nextQuestion() {
    if (quizNo < this.quizList.length) {
      this.quizNo++;
      if (quizNo == this.quizList.length) {
        quizNo = this.quizList.length - 1;
        this.gameEnded = true;
      }
    }
  }

  bool checkEndGame() {
    return gameEnded;
  }

  void resetGame() {
    quizNo = 0;
    gameEnded = false;
  }
}
