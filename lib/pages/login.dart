// ignore_for_file: prefer_const_constructors

import 'package:app/components/textfield.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {
  Loginpage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 215, 180),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              Image(
                image: AssetImage('assets/images/KS.png'),
              ),
              const SizedBox(
                height: 36,
              ),
              MyTextField_Rectangle(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
                icon: Icon(Icons.person),
              ),
              const SizedBox(
                height: 24,
              ),
              MyTextField_Rectangle(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
                icon: Icon(Icons.lock),
              ),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 52,
              ),
              Text('Dont have an account?'),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'sign up',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
