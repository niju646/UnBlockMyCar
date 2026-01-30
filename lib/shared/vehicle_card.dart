import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unblockmycar/shared/common_text.dart';

class VehicleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? widget;
  const VehicleCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(39),
            blurRadius: 12,
            spreadRadius: 2,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          //icon
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue[50],
            ),
            child: Icon(CupertinoIcons.car_detailed, color: Color(0xFF0A3D62)),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(name: title),
                CommonText(name: subtitle, textcolor: Colors.grey),
              ],
            ),
          ),
          SizedBox(width: 2),

          // Status chips
          if (widget != null) widget!,
        ],
      ),
    );
  }
}
