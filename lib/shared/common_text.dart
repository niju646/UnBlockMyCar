import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String name;
  final double? fontsize;
  final Color? textcolor;
  final FontWeight? font;
  final int? lines;
  final TextAlign? align;

  const CommonText({
    super.key,
    required this.name,
    this.fontsize,
    this.textcolor,
    this.font,
    this.lines,
    this.align,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: align,
      maxLines: lines,
      name,
      style: TextStyle(fontSize: fontsize, color: textcolor, fontWeight: font,),
    );
  }
}
