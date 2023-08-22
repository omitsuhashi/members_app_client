import 'package:flutter/material.dart';

import '../../consts/validation_message.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<StatefulWidget> createState() => SigninState();
}

class SigninState extends State<SigninPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  onPressSigninButton() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("..サインイン中")));
      print(emailController.text);
      print(passwordController.text);
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
            ElevatedButton(
                onPressed: onPressSigninButton, child: const Text("サインイン"))
          ],
        ));
  }
}
