import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final String fullName = 'Иванов Иван Иванович'; // Статичные данные
  final String grade = '6 класс';

  List<String> selectedSubjects = [];

  final List<String> subjects = [
    'Математика',
    'Физика',
    'Химия',
    'Биология',
    'История'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Профиль ученика'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            Text('ФИО: $fullName', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Класс: $grade', style: TextStyle(fontSize: 18)),
            Divider(height: 32),
            Text('Выберите предмет:',
                style: TextStyle(fontSize: 20)),
            Wrap(
              spacing: 8.0,
              children: subjects.map((subject) {
                return FilterChip(
                  label: Text(subject),
                  selected: selectedSubjects.contains(subject),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        selectedSubjects.add(subject);
                      } else {
                        selectedSubjects.remove(subject);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                if (selectedSubjects.isNotEmpty) {
                  Navigator.pushNamed(context, '/subjects');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Выберите хотя бы один предмет.')),
                  );
                }
              },
              child: Text('Продолжить'),
            )
          ],
        ),
      ),
    );
  }
}
