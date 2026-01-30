import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:go_router/go_router.dart';
import 'package:unblockmycar/features/home/widgets/dark_over_lay.dart';
import 'package:unblockmycar/features/home/widgets/scan_frame.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:unblockmycar/shared/common_button.dart';
import 'package:unblockmycar/shared/common_notification_bar.dart';
import 'package:unblockmycar/shared/common_text.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  CameraController? _controller;
  String? detectedPlate;
  bool isProcessing = false;

  //ocr function to detect number plate
  Future<void> detectNumberPlate() async {
    if (isProcessing || detectedPlate != null) return;

    setState(() => isProcessing = true);

    final image = await _controller!.takePicture();

    final inputImage = InputImage.fromFilePath(image.path);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

    final RecognizedText recognizedText = await textRecognizer.processImage(
      inputImage,
    );

    await textRecognizer.close();

    for (final block in recognizedText.blocks) {
      for (final line in block.lines) {
        String text = line.text
            .toUpperCase()
            .replaceAll(RegExp(r'[^A-Z0-9]'), '')
            .replaceAll('O', '0');

        log("OCR LINE: ${line.text}");
        log("NORMALIZED: $text");

        final regExp = RegExp(r'^[A-Z]{2}[0-9]{2}[A-Z]{1,2}[0-9]{4}$');

        if (regExp.hasMatch(text)) {
          setState(() {
            detectedPlate = text;
            isProcessing = false;
          });
          if (!mounted) return;
          CustomSnackBar.showSuccess(context, message: "Number plate detected");
          return;
        }
      }
    }

    setState(() => isProcessing = false);
  }

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    _controller = CameraController(
      cameras.first,
      ResolutionPreset.high,
      enableAudio: false,
    );
    await _controller!.initialize();
    setState(() {});
    detectNumberPlate();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CameraPreview(_controller!),
          const DarkOverlay(),
          const ScanFrame(),
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Position the number plate within the frame",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Column(
              children: [
                CommonButton(
                  color: Color(0xFF0A3D62),
                  onPressed: () {
                    if (detectedPlate != null) {
                      context.pop(detectedPlate);
                    }
                  },
                  child: CommonText(
                    name: "Use This Number",
                    textcolor: Colors.white,
                  ),
                ),

                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() => detectedPlate = null);
                      detectNumberPlate();
                    },
                    child: CommonText(name: "Scan", textcolor: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: 60,
            right: 40,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Icon(
                  CupertinoIcons.multiply,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
