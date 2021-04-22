import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  double percentage = 0.0;
  double newPercentage = 0.0;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    controller.addListener(() {
      setState(() {
        percentage = lerpDouble(percentage, newPercentage, controller.value)!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          percentage = newPercentage;
          newPercentage += 10;
          if (newPercentage > 100) {
            newPercentage = 0;
            percentage = 0;
          }
          controller.forward(from: 0.0);
          setState(() {});
        },
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          padding: EdgeInsets.all(5),
          child: CustomPaint(
            painter: _RadialProgressPainter(percentage: percentage),
          ),
        ),
      ),
    );
  }
}

class _RadialProgressPainter extends CustomPainter {
  _RadialProgressPainter({required this.percentage});
  final double percentage;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 5
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint);

    final paintArc = Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * math.pi * ( percentage / 100 );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      arcAngle,
      false,
      paintArc,
    );
  }

  @override
  bool shouldRepaint(_RadialProgressPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_RadialProgressPainter oldDelegate) => false;
}
