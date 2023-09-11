import 'package:base/components/atoms/divider_with_message.dart';
import 'package:base/components/organisms/auth_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<StatefulWidget> createState() => _SigninState();
}

class _SigninState extends State<SigninPage> {
  final auth = FirebaseAuth.instance;

  onPressSigninButton(String email, String password) {
    print(email);
    print(password);
    try {
      auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message ?? "サインインできませんでした")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SignInButton(
          Buttons.google,
          text: "Sign up with Google",
          onPressed: () {},
        ),
        const Spacer(),
        const DividerWithTextWidget(text: Text("OR")),
        const Spacer(),
        AuthFormWidget(
          onPressSubmit: onPressSigninButton,
          authType: AuthType.signin,
        ),
      ],
    );
  }
}
