import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unblockmycar/shared/common_logo.dart';
import 'package:unblockmycar/shared/common_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;
    context.go('/homescreen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0A3D62), Color(0xFF0F6E8C)],
          ),
        ),
        child: Column(
          children: [
            const Spacer(),

            // LOGO
            CommonLogo(),

            const SizedBox(height: 30),

            // APP NAME
            CommonText(
              name: "Unblock My Car",
              font: FontWeight.w600,
              fontsize: 26,
              textcolor: Colors.white,
            ),

            const SizedBox(height: 10),
            const Spacer(),

            // INITIALIZING TEXT
            CommonText(
              name: "INITIALIZING",
              fontsize: 12,
              textcolor: Colors.white,
            ),

            const SizedBox(height: 12),

            // PROGRESS BAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: LinearProgressIndicator(
                minHeight: 2,
                backgroundColor: Colors.white.withAlpha(51),
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            // FOOTER TEXT
            CommonText(
              name: "PREMIUM TOOLS",
              fontsize: 10,
              textcolor: Colors.grey,
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
