//scan frame
import 'package:flutter/material.dart';

class ScanFrame extends StatelessWidget {
  const ScanFrame({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.75;

    return Positioned(
      top: MediaQuery.of(context).size.height / 2 - 80,
      left: MediaQuery.of(context).size.width * 0.125,
      child: SizedBox(
        width: width,
        height: 160,
        child: CustomPaint(painter: _FramePainter()),
      ),
    );
  }
}

class _FramePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    const c = 20.0;

    canvas.drawLine(Offset(0, 0), Offset(c, 0), paint);
    canvas.drawLine(Offset(0, 0), Offset(0, c), paint);

    canvas.drawLine(Offset(size.width, 0), Offset(size.width - c, 0), paint);
    canvas.drawLine(Offset(size.width, 0), Offset(size.width, c), paint);

    canvas.drawLine(Offset(0, size.height), Offset(c, size.height), paint);
    canvas.drawLine(Offset(0, size.height), Offset(0, size.height - c), paint);

    canvas.drawLine(
      Offset(size.width, size.height),
      Offset(size.width - c, size.height),
      paint,
    );
    canvas.drawLine(
      Offset(size.width, size.height),
      Offset(size.width, size.height - c),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
