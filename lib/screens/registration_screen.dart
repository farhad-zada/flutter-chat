import 'package:chat/screens/chat_screen.dart';
import 'package:chat/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'r';
  const RegistrationScreen({super.key});
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'lightening',
              child: SizedBox(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            ReusableTextField(
              hint: 'Enter your email',
              onChanged: (value) {
                email = value;
              },
            ),
            const SizedBox(
              height: 8.0,
            ),
            ReusableTextField(
              hint: 'Enter your password',
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
            ),
            const SizedBox(
              height: 24.0,
            ),
            CustomButton(
              tittle: 'Register',
              onPressed: () async {
                if (email != null && password != null) {
                  try {
                    await _auth.createUserWithEmailAndPassword(
                        email: email!, password: password!);
                    navigateToChat();
                  } catch (e) {
                    final match = RegExp(r'\[.*\](.*)').firstMatch('$e');
                    String errorMessage =
                        match?.group(1) ?? 'Somethign went wrong';
                    ScaffoldMessenger.of(context).showSnackBar(
                      customSnackBar(errorMessage),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    customSnackBar(
                      'Please enter your email and password.',
                    ),
                  );
                }
              },
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }

  SnackBar customSnackBar(String content) {
    return SnackBar(
      content: Text(
        content,
        style: const TextStyle(
          fontSize: 20.0,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.redAccent,
      duration: const Duration(seconds: 1),
    );
  }

  void navigateToChat() {
    Navigator.pushNamed(context, ChatScreen.id);
  }
}
