//floating card
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unblockmycar/routes/router_constants.dart';
import 'package:unblockmycar/shared/common_text.dart';

class FloatingCard2 extends StatelessWidget {
  final String name;
  final String subtitle;
  const FloatingCard2({super.key, required this.name, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blue[50],
                child: Icon(
                  CupertinoIcons.person,
                  color: Color(0xFF0A3D62),
                  size: 35,
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(name: name, font: FontWeight.bold, fontsize: 20),

                  CommonText(
                    name: subtitle,
                    fontsize: 15,
                    textcolor: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 30),

          //details card
          GestureDetector(
            onTap: () {
              context.pushNamed(RouterConstants.notificationScreen);
            },
            child: SizedBox(
              child: Row(
                children: [
                  Icon(Icons.notifications_none, color: Color(0xFF0A3D62)),
                  SizedBox(width: 10),
                  CommonText(name: "Notifications"),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios, size: 15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
