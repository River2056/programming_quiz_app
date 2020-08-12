import 'quiz.dart';
import 'constants.dart';
import 'quiz_database.dart';

class QuizCenter {
  int quizNo = 0;
  bool gameEnded = false;
  List<Quiz> quizList = [];

  void initQuizList() {
    database.shuffle();
    for (int i = 0; i < 9; i++) {
      quizList.add(database[i]);
    }
  }

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
    this.quizList.shuffle();
  }

  void shuffleList() {
    this.quizList.shuffle();
  }
}
