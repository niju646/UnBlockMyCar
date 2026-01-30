import 'package:flutter/material.dart';
import 'package:unblockmycar/shared/common_text.dart';

class CommonBanner extends StatelessWidget {
  final IconData? icon;
  final String title;
  final int? lines;
  const CommonBanner({super.key, this.icon, required this.title, this.lines});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue[50],
      ),
      child: Row(
        children: [
          (icon != null)
              ? Icon(icon, color: Color(0xFF0A3D62))
              : SizedBox.shrink(),
          SizedBox(width: 10),
          Expanded(
            child: CommonText(
              name: title,
              textcolor: Color.fromARGB(255, 13, 100, 161),
              lines: lines,
              fontsize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
