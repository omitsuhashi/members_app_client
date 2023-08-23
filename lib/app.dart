import 'package:client/pages/auth/signup.dart';
import 'package:client/pages/sample_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Members App',
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // スプラッシュ画面などに書き換えても良い
              return const SizedBox();
            }
            if (snapshot.hasData) {
              // User が null でなない、つまりサインイン済みのホーム画面へ
              return const MyApp();
            }
            // User が null である、つまり未サインインのサインイン画面へ
            return Scaffold(
                appBar: AppBar(title: const Text("ログイン画面")),
                body: const SignupPage());
          },
        ),
      );
}
