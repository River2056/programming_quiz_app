import 'quiz.dart';

class QuizCenter {
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
      answer: 'print(\'Hello World!\')',
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
      answer: 'console.log(\'something\')',
    )
  ];

  // get next question

  // check answer

}
