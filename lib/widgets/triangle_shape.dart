import 'package:flutter/material.dart';

class TriangleShape extends CustomPainter {

   Paint? painter;

  TriangleShape( ) {

    painter = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

  }

  @override
  void paint(Canvas canvas, Size size) {

    var path = Path();
    path.lineTo(size.height, 0);
    path.lineTo(size.height/2, size.width);
    path.close();

    canvas.drawPath(path, painter!);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}