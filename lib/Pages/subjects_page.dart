import 'package:flutter/material.dart';

class SubjectsPage extends StatelessWidget {
  final Map<String, List<String>> subjectTopics = {
    'Математика': ['Деление дробей', 'Уравнения'],
    'Физика': ['Сила и давление'],
    'Химия': ['Атомы и молекулы'],
    'Биология': ['Клетка'],
    'История': ['История Казахстана'],
  };

  @override
  Widget build(BuildContext context) {
    final allTopics = subjectTopics.entries.expand((entry) {
      return entry.value.map((topic) => {
            'subject': entry.key,
            'topic': topic,
          });
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Темы для изучения'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView.builder(
          itemCount: allTopics.length,
          itemBuilder: (context, index) {
            final item = allTopics[index];
            return Card(
              child: ListTile(
                title: Text(item['topic']!),
                subtitle: Text(item['subject']!),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/quiz',
                    arguments: {
                      'subject': item['subject']!,
                      'topic': item['topic']!,
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
