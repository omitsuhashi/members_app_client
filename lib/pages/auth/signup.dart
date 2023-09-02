import 'package:base/components/organisms/auth_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<StatefulWidget> createState() => SigninState();
}

class SigninState extends State<SignupPage> {
  onPressSignupButton(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message ?? "サインアップできませんでした")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthFormWidget(
      onPressSubmit: onPressSignupButton,
      authType: AuthType.signup,
    );
  }
}
