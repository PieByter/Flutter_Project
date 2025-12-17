import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import '../../config/preview_config.dart';

@AppPreview(name: 'Signature Page', group: 'Signature')
Widget signaturePageReview() {
  return MaterialApp(home: SignaturePage(), debugShowCheckedModeBanner: false);
}

class SignaturePage extends StatefulWidget {
  const SignaturePage({super.key});

  @override
  State<SignaturePage> createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  Uint8List? _signatureImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tanda Tangan Elektronik')),
      body: Column(
        children: [
          Signature(
            controller: _controller,
            height: 200,
            backgroundColor: Colors.grey[200]!,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text('Clear'),
                onPressed: () => _controller.clear(),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                child: Text('Simpan'),
                onPressed: () async {
                  if (_controller.isNotEmpty) {
                    final image = await _controller.toPngBytes();
                    setState(() {
                      _signatureImage = image;
                    });
                    // Upload image ke server, dapatkan link string
                    // Simpan link string ke database
                  }
                },
              ),
            ],
          ),
          if (_signatureImage != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.memory(_signatureImage!),
            ),
        ],
      ),
    );
  }
}
