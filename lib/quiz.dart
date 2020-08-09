import 'package:program_quiz_app/main.dart';
import 'constants.dart';

class Quiz {
  final int quizNumber;
  final String quizContent;
  final List<String> choices;
  final Decision answer;

  Quiz({this.quizNumber, this.quizContent, this.choices, this.answer});
}
