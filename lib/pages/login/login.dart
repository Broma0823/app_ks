import 'package:app/components/buttons/my_signInButton.dart';
import 'package:app/components/my_squaretile.dart';
import 'package:app/components/textfields/my_sign_in_textfield.dart';
import 'package:app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  final Function()? onTap;
  const Loginpage({super.key, required this.onTap});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //sign in
  void signUserIn() async {
    //loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //try signing in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      //stop the progress indicator
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //wrong email
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.red,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 64,
              ),
              Image.asset(
                'assets/images/propertytracker.png',
                height: 250,
              ),
              //username textbox
              const SizedBox(
                height: 30,
              ),
              MyTextField_Rectangle(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),
              const SizedBox(
                height: 12,
              ),
              //password textbox
              MyTextField_Rectangle(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              //sign in button
              MyButton(
                onTap: signUserIn,
                buttonText: 'Sign In',
              ),
              //divider
              const SizedBox(
                height: 30,
              ),
              // ignore: prefer_const_constructors
              Row(
                children: const [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Color.fromARGB(255, 39, 39, 39),
                    ),
                  ),
                  Text("Continue with"),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Color.fromARGB(255, 94, 94, 94),
                    ),
                  ),
                ],
              ),

              //google
              const SizedBox(
                height: 52,
              ),
              SquareTile(
                  imagePath: 'assets/images/Google.png',
                  onTap: () => AuthService().signInWithGoogle()),
              //sign up
              const SizedBox(
                height: 52,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dont have an account?',
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Sign up',
                      style: TextStyle(color: Color.fromARGB(255, 2, 6, 255)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
