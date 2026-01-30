import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unblockmycar/shared/common_banner.dart';
import 'package:unblockmycar/shared/common_card.dart';
import 'package:unblockmycar/shared/common_text.dart';

class NotifyScreen extends StatelessWidget {
  const NotifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0A3D62), Color(0xFF0F6E8C)],
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 90),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      width: 300,
                      height: 65,
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(39), // glass effect
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white.withAlpha(77)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(39),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Row(
                        children: const [
                          CommonText(name: "Vehicle", textcolor: Colors.white),
                          Spacer(),
                          CommonText(
                            name: "KL-07-CD-5678",
                            font: FontWeight.bold,
                            textcolor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          /////////////
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(name: "Choose Notification Method", fontsize: 20),
                SizedBox(height: 30),
                CommonCard(
                  subtitle: "Place a masked call to the owner",
                  title: "Anonymous Call",
                  icon: CupertinoIcons.phone,
                  iconColor: Colors.green,
                  isIcon: false,
                ),
                SizedBox(height: 20),
                CommonCard(
                  subtitle: "Send a text notification",
                  title: "Anonymous Message",
                  icon: Icons.messenger_outline_sharp,
                  iconColor: Color(0xFF0A3D62),
                  isIcon: false,
                ),
                SizedBox(height: 20),
                CommonCard(
                  subtitle: "Send push notification  to owner",
                  title: "In-App Alert",
                  icon: Icons.notifications_none,
                  iconColor: Colors.amber,
                  isIcon: false,
                ),
                SizedBox(height: 20),
                CommonBanner(
                  title:
                      "Your identity will remain completely anonymous.\nThe vehicle owner will not see your phone number",
                  lines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
