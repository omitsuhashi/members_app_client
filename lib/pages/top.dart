import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TopPage extends StatefulWidget {
  const TopPage({super.key});

  @override
  State<StatefulWidget> createState() => _TopState();
}

class _TopState extends State<TopPage> {
  String _message = '';
  bool _qrCodeGenerated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('会員証'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    _message = value;
                    if (_qrCodeGenerated) {
                      setState(() {
                        _qrCodeGenerated = false;
                      });
                    }
                  },
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () => setState(() {
                  _qrCodeGenerated = true;
                }),
              ),
            ],
          ),
          (_qrCodeGenerated)
              ? QrImageView(
                  embeddedImage: const NetworkImage(
                    'https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png',
                  ),
                  data: _message,
                  gapless: true,
                )
              : const Center(
                  child: Text('QRコード用のテキストを入力して、\n ボタンを押してください'),
                ),
        ],
      ),
    );
  }
}
