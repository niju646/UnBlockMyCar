import 'package:flutter/material.dart';

class CommonLogo extends StatelessWidget {
  final double width;
  final double height;
  const CommonLogo({super.key, this.height = 90, this.width = 90});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(child: Image.asset("assets/car.png")),
    );
  }
}
