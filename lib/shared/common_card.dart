import 'package:flutter/material.dart';
import 'package:unblockmycar/shared/common_icon.dart';
import 'package:unblockmycar/shared/common_text.dart';

class CommonCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? icon;
  final IconData? icon2;
  final Color? iconColor;
  final VoidCallback? onTap;
  final bool isIcon;
  final int? lines;

  const CommonCard({
    super.key,
    this.icon,
    this.iconColor,
    required this.subtitle,
    required this.title,
    this.onTap,
    this.isIcon = true,
    this.icon2,
    this.lines,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(39),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // leading icon box
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: iconColor),
            ),

            const SizedBox(width: 16),

            // title & subtitle
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(name: title, font: FontWeight.bold),
                  const SizedBox(height: 4),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 5,
                    children: [
                      if (icon2 != null)
                        Icon(icon2, size: 15, color: Colors.grey),

                      CommonText(
                        name: subtitle,
                        textcolor: Colors.grey,
                        fontsize: 12,
                        lines: lines,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // suffix arrow
            (isIcon)
                ? CommonIcon(
                    icon: Icons.arrow_forward_ios_rounded,
                    iconSize: 14,
                    color: Colors.grey,
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
