//status chip
import 'package:flutter/material.dart';
import 'package:unblockmycar/shared/common_text.dart';

class StatusChip extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;

  const StatusChip({
    super.key,

    required this.text,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: CommonText(name: text, fontsize: 12, textcolor: textColor),
    );
  }
}
