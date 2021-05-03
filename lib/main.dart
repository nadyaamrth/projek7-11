import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
// TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _question = const [
    {
      'question': 'Siapa nama kamu?',
      'answers': [
        {'text': 'Nadya', 'score': 2},
        {'text': 'Nadya Margarreth', 'score': 6},
        {'text': 'Margarreth', 'score': 10},
        {'text': 'Nad', 'score': 3},
      ],
    },
    {
      'question': 'Apa pekerjaannmu?',
      'answers': [
        {'text': 'Dokter', 'score': 4},
        {'text': 'Tentara', 'score': 6},
        {'text': 'Mahasiswa', 'score': 3},
        {'text': 'Guru', 'score': 10},
      ],
    },
    {
      'question': 'Dimana tempat tinggalmu?',
      'answers': [
        {'text': 'Metro', 'score': 10},
        {'text': 'Way Kanan', 'score': 7},
        {'text': 'Bandar Lampung', 'score': 4},
        {'text': 'Mesuji', 'score': 3},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = score;
    setState(() {
      _questionIndex++;
    });
    print('jawaban telah terpilih');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Aplikasi1'),
        ),
        body: _questionIndex < _question.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                question: _question,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
