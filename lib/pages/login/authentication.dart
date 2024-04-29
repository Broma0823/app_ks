import 'package:app/pages/homepage_navbar.dart';
import 'package:app/pages/login/toggle_login_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user logged in
          if (snapshot.hasData) {
            return const HomePageTest();
          }

          //user not logged in
          else {
            return const LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
