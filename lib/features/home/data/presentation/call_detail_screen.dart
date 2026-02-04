import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:unblockmycar/features/home/data/provider/call_provider.dart';
import 'package:unblockmycar/shared/common_notification_bar.dart';
import 'package:unblockmycar/shared/common_text.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isCallAccepted = false;
  bool isMuted = false;
  bool isSpeakerOn = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildAvatarWithRipple() {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        final scale = 1 + (_animationController.value * 0.05);

        return Transform.scale(
          scale: scale,
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: Colors.white.withAlpha(
                  150 + (_animationController.value * 100).toInt(),
                ),
                width: 3,
              ),

              boxShadow: [
                BoxShadow(
                  color: Colors.white.withAlpha(
                    26 + (_animationController.value * 100).toInt(),
                  ),
                  blurRadius: 12,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: const Icon(Icons.person, size: 60, color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0B1F3A), Color(0xFF0E3A66), Color(0xFF1E5FA3)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Spacer(),
                _buildCallerInfo(),
                const SizedBox(height: 20),

                const Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withAlpha(40),
                        border: Border.all(
                          color: Colors.white.withAlpha(60),
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        children: [
                          // Icon grid (row 1)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              _CallIcon(icon: Icons.volume_off, label: "Mute"),
                              _CallIcon(
                                icon: CupertinoIcons.keyboard,
                                label: "Keypad",
                              ),
                              _CallIcon(
                                icon: CupertinoIcons.speaker,
                                label: "Speaker",
                              ),
                            ],
                          ),

                          const SizedBox(height: 24),

                          // Icon grid (row 2)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              _CallIcon(icon: Icons.pause, label: "Hold"),
                              _CallIcon(
                                icon: CupertinoIcons.recordingtape,
                                label: "Record",
                              ),
                              _CallIcon(icon: Icons.message, label: "Message"),
                            ],
                          ),

                          const SizedBox(height: 20),

                          // Call end buttons
                          GestureDetector(
                            onTap: () {
                              final endcall = context.read<CallProvider>();
                              endcall.endCall();
                              CustomSnackBar.showError(
                                context,
                                message: "Call ended",
                              );
                              context.pop();
                            },
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                              child: Icon(Icons.call_end, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 70),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCallerInfo() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            // Avatar
            _buildAvatarWithRipple(),
          ],
        ),
        const SizedBox(height: 24),

        // Caller Name
        CommonText(
          name: "Gopinath",
          font: FontWeight.bold,
          fontsize: 32,
          textcolor: Colors.white,
        ),

        // const SizedBox(height: 8),
        // // Caller Number
        // CommonText(
        //   name: "+91 1234 098765",
        //   fontsize: 16,
        //   textcolor: Colors.white.withAlpha(179),
        // ),
        CommonText(name: "calling.....", textcolor: Colors.grey),
      ],
    );
  }
}

//call icons
class _CallIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _CallIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(icon, size: 30, color: Colors.white),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    );
  }
}
