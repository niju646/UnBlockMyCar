import 'package:flutter/material.dart';

class CommonIcon extends StatelessWidget {
  final Color? color;
  final IconData? icon;
  final VoidCallback? onPressed;
  final double? iconSize;
  const CommonIcon({
    super.key,
    this.color,
    this.icon,
    this.onPressed,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(icon, color: color, size: iconSize),
    );
  }
}
