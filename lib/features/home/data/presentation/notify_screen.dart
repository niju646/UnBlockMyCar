import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:unblockmycar/features/home/data/provider/call_provider.dart';
import 'package:unblockmycar/routes/router_constants.dart';
import 'package:unblockmycar/shared/common_banner.dart';
import 'package:unblockmycar/shared/common_card.dart';
import 'package:unblockmycar/shared/common_pop_up.dart';
import 'package:unblockmycar/shared/common_text.dart';

class NotifyScreen extends StatelessWidget {
  final String? vehicleNumber;
  const NotifyScreen({super.key, required this.vehicleNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<CallProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            Container(
              color: Colors.black.withAlpha(77),
              child: const Center(child: CircularProgressIndicator()),
            );
          }
          return Stack(
            children: [
              Column(
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
                                color: Colors.white.withAlpha(
                                  39,
                                ), // glass effect
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white.withAlpha(77),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withAlpha(39),
                                    blurRadius: 12,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  CommonText(
                                    name: "Vehicle",
                                    textcolor: Colors.white,
                                  ),
                                  Spacer(),
                                  CommonText(
                                    name: vehicleNumber ?? "KL-07-CD-5678",
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
                        CommonText(
                          name: "Choose Notification Method",
                          fontsize: 20,
                        ),
                        SizedBox(height: 30),
                        CommonCard(
                          isCrown: false,
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => CommonPopUp(
                                title: "Start a call?",
                                subtitle:
                                    "Are you sure you want to call this person?",
                                iconText: "Start Call",
                                onPressed: () {
                                  Navigator.pop(context);

                                  final callProvider = context
                                      .read<CallProvider>();

                                  callProvider.createCall(
                                    to: "+919567588983", // replace with owner number
                                  );
                                  context.pushNamed(
                                    RouterConstants.callingScreen,
                                  );
                                },
                              ),
                            );
                          },
                          subtitle:
                              "Connect to owner without revealing your\n phone number",
                          title: "Secure Call",
                          icon: CupertinoIcons.phone,
                          iconColor: Colors.green,
                          isIcon: false,
                        ),
                        SizedBox(height: 20),

                        //text notification
                        CommonCard(
                          isCrown: false,
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => CommonPopUp(
                                iscancel: false,
                                title: "In App-Alert Unavailable",
                                subtitle:
                                    "This feature works only when the opposite vehicle owner has 'Unblock My Car' app installed. When both users have the app you can connect directly in-app, no phone numbers are shared faster and more secure communication Since the owner isn’t using the app yet, please choose another contact option.",
                                iconText: "Ok",
                                onPressed: () {
                                  context.pop();
                                },
                              ),
                            );
                          },
                          subtitle:
                              "Send a notification without sharing\n personal contact details",
                          title: "Secure Message",
                          icon: Icons.messenger_outline_sharp,
                          iconColor: Color(0xFF0A3D62),
                          isIcon: false,
                        ),
                        SizedBox(height: 20),

                        //push notification
                        CommonCard(
                          isCrown: false,
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => CommonPopUp(
                                iscancel: false,
                                title: "In App-Alert Unavailable",
                                subtitle:
                                    "This feature works only when the opposite vehicle owner has 'Unblock My Car' app installed. When both users have the app you can connect directly in-app, no phone numbers are shared faster and more secure communication Since the owner isn’t using the app yet, please choose another contact option.",
                                iconText: "Ok",
                                onPressed: () {
                                  context.pop();
                                },
                              ),
                            );
                          },
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
            ],
          );
        },
      ),
    );
  }
}
