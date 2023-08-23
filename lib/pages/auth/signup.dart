import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../consts/validation_message.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<StatefulWidget> createState() => SigninState();
}

class SigninState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  onPressSignupButton() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("..サインアップ中")));
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      } on FirebaseAuthException catch (e) {
        // TODO エラーハンドリングを行う
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "メールアドレス"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AuthValidation.EMAIL_NOTNULL;
                }
                return null;
              },
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: "パスワード"),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AuthValidation.PASSWORD_NOTNULL;
                }
                return null;
              },
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: onPressSignupButton,
                child: const Text('サインアップ'),
              ),
            )
          ],
        ));
  }
}
