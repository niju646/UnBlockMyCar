import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unblockmycar/routes/router_constants.dart';
import 'package:unblockmycar/shared/common_banner.dart';
import 'package:unblockmycar/shared/common_button.dart';
import 'package:unblockmycar/shared/common_card.dart';
import 'package:unblockmycar/shared/common_icon.dart';
import 'package:unblockmycar/shared/common_logo.dart';
import 'package:unblockmycar/shared/common_notification_bar.dart';
import 'package:unblockmycar/shared/common_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              //first container
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                width: double.infinity,
                height: 200,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF0A3D62), Color(0xFF0F6E8C)],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CommonLogo(height: 44, width: 44),
                        const SizedBox(width: 12),

                        CommonText(
                          name: "Unblock My Car",
                          textcolor: Colors.white,
                          font: FontWeight.bold,
                          fontsize: 16,
                        ),

                        const Spacer(),

                        CommonIcon(
                          icon: Icons.history,
                          color: Colors.white,
                          onPressed: () {
                            context.pushNamed(RouterConstants.historyScreen);
                          },
                        ),
                        const SizedBox(width: 16),

                        CommonIcon(
                          icon: Icons.notifications,
                          color: Colors.white,
                          onPressed: () {
                            context.pushNamed(
                              RouterConstants.notificationScreen,
                            );
                          },
                        ),
                        const SizedBox(width: 16),

                        CommonIcon(
                          icon: Icons.person,
                          color: Colors.white,
                          onPressed: () {
                            context.pushNamed(RouterConstants.profileScreen);
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    CommonText(
                      name: "Find and notify vehicle owner anonymously",
                      textcolor: Colors.white70,
                      fontsize: 13,
                    ),
                  ],
                ),
              ),

              //second container
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  color: Colors.white,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(2, 170, 2, 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          name: "How it works",
                          font: FontWeight.bold,
                          fontsize: 18,
                        ),
                        SizedBox(height: 5),
                        CommonCard(
                          iconColor: Color.fromARGB(255, 15, 86, 119),
                          icon: Icons.search,
                          title: "Enter Number",
                          subtitle: "scan or type vehicle number",
                          isIcon: false,
                        ),
                        SizedBox(height: 10),
                        CommonCard(
                          iconColor: Color.fromARGB(255, 15, 86, 119),
                          icon: CupertinoIcons.car_detailed,
                          title: "Find Vehicle",
                          subtitle: "View vehicle details instantly",
                          isIcon: false,
                        ),
                        SizedBox(height: 10),
                        CommonCard(
                          onTap: () {
                            log("notify tapped");
                          },
                          iconColor: Color.fromARGB(255, 15, 86, 119),
                          icon: Icons.notifications_none,
                          title: "Notify Owner",
                          subtitle: "Send anonymous alert",
                          isIcon: false,
                        ),
                        SizedBox(height: 10),
                        CommonBanner(
                          icon: Icons.shield_outlined,
                          title:
                              "100% Anonymous\nYour identity will never shared with vehicle owners",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          Positioned(
            top: 165,
            right: 20,
            left: 20,
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(39),
                    blurRadius: 12,
                    spreadRadius: 2,
                    offset: const Offset(0, 6),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CommonText(name: "Vehicle Number", fontsize: 18),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        //text field
                        child: TextField(
                          controller: _searchController,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: "KL-07-AB-1234",
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),

                      //camera icon
                      GestureDetector(
                        onTap: () async {
                          final scannedValue = await context.pushNamed<String>(
                            RouterConstants.scannerScreen,
                          );

                          if (scannedValue != null) {
                            setState(() {
                              _searchController.text = scannedValue;
                            });
                            if (!context.mounted) return;
                            CustomSnackBar.showSuccess(
                              context,
                              message: "NUmber added",
                            );
                          }
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: CommonIcon(icon: CupertinoIcons.camera),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  CommonButton(
                    icon: Icons.search,
                    color: const Color.fromARGB(255, 15, 86, 119),
                    onPressed: () {
                      context.pushNamed(RouterConstants.carDetailScreen);
                    },
                    child: CommonText(
                      name: "Get Vehicle Details",
                      textcolor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
