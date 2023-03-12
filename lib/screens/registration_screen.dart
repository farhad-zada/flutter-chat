import 'package:chat/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'r';
  const RegistrationScreen({super.key});
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
            const ReusableTextField(hint: 'Enter your email'),
            const SizedBox(
              height: 8.0,
            ),
            const ReusableTextField(hint: 'Enter your password'),
            const SizedBox(
              height: 24.0,
            ),
            CustomButton(
                tittle: 'Register', onPressed: () {}, color: Colors.blueAccent),
          ],
        ),
      ),
    );
  }
}
