import 'package:flutter/material.dart';

class TimeClockWidget extends StatefulWidget {
  @override
  _TimeClockWidgetState createState() => _TimeClockWidgetState();
}

class _TimeClockWidgetState extends State<TimeClockWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill
      ..color = Colors.green
      ..invertColors = false;

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
