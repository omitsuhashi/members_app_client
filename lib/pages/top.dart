import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TopPage extends StatefulWidget {
  const TopPage({super.key});

  @override
  State<StatefulWidget> createState() => _TopState();
}

class _TopState extends State<TopPage> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('会員証'),
      ),
      body: Column(
        children: [
          QrImageView(
            data: auth.currentUser?.uid ?? "",
            gapless: true,
          )
        ],
      ),
    );
  }
}
