import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import 'package:lms_master_thesis/Pages/home_page.dart';
import 'package:lms_master_thesis/Pages/login_screen.dart';
import 'profile_page.dart';


class AuthGate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasData) {
          return ProfilePage();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}