import 'package:flutter/material.dart';
import 'package:lms_master_thesis/Pages/home_page.dart';
import 'package:lms_master_thesis/Pages/profile_page.dart';
import 'package:lms_master_thesis/Pages/subjects_page.dart';
import 'package:lms_master_thesis/Pages/quiz_page.dart';
import 'package:lms_master_thesis/Pages/auth_gate.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BilimApp());
}

class BilimApp extends StatelessWidget {

  const BilimApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bilim AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
        '/subjects': (context) => SubjectsPage(),
        '/quiz': (context) => QuizPage(),
        '/authPage': (context) => AuthGate(),
      },
    );
  }
}