import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late String subject;
  late String topic;
  int currentQuestionIndex = 0;
  int score = 0;
  bool quizFinished = false;

  final List<Map<String, Object>> questions = [
    {
      'question': 'Сколько будет 1/2 + 1/4?',
      'answers': ['3/4', '1', '1/2'],
      'correct': '3/4',
    },
    {
      'question': 'Сколько процентов в числе 0.75?',
      'answers': ['75%', '50%', '25%'],
      'correct': '75%',
    },
    {
      'question': 'Какое уравнение является линейным?',
      'answers': ['x + 2 = 5', 'x² = 4', 'x³ - 2 = 0'],
      'correct': 'x + 2 = 5',
    },
  ];

  void answerQuestion(String answer) {
    final correctAnswer = questions[currentQuestionIndex]['correct'] as String;
    if (answer == correctAnswer) score++;

    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        quizFinished = true;
      }
    });
  }

  String getRecommendation() {
    final percent = (score / questions.length) * 100;
    if (percent >= 80) return 'Отличный результат!';
    if (percent >= 50) return 'Хорошо, но можно лучше.';
    return 'Рекомендуем повторить материал.';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    subject = args['subject'] ?? 'Предмет';
    topic = args['topic'] ?? 'Тема';
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(title: Text('$topic ($subject)')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: quizFinished
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Тест завершён!',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 16),
                  Text('Результат: $score из ${questions.length}'),
                  SizedBox(height: 16),
                  Text(getRecommendation()),
                  SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Назад к темам'),
                  )
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Вопрос ${currentQuestionIndex + 1}/${questions.length}',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 16),
                  Text(
                    currentQuestion['question'] as String,
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 24),
                  ...(currentQuestion['answers'] as List<String>).map((answer) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                        onPressed: () => answerQuestion(answer),
                        child: Text(answer),
                      ),
                    );
                  }).toList()
                ],
              ),
      ),
    );
  }
}
