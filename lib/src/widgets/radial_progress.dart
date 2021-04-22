import 'dart:math' as math;

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryWidth;
  final double secondaryWidth;
  final StrokeCap strokeCap;

  RadialProgress({
    required this.percentage,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.secondaryWidth = 5.0,
    this.primaryWidth = 10.0,
    this.strokeCap = StrokeCap.round,
  });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  double previousPercentage = 0.0;

  @override
  void initState() {
    super.initState();
    previousPercentage = widget.percentage;
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final difference = widget.percentage - previousPercentage;
    previousPercentage = widget.percentage;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(10),
          child: CustomPaint(
            painter: _RadialProgressPainter(
              percentage: ((widget.percentage - difference) + (difference * controller.value)),
              primaryColor: widget.primaryColor,
              secondaryColor: widget.secondaryColor,
              primaryWidth: widget.primaryWidth,
              secondaryWidth: widget.secondaryWidth,
              strokeCap: widget.strokeCap,
            ),
          ),
        );
      },
    );
  }
}

class _RadialProgressPainter extends CustomPainter {
  final double percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryWidth;
  final double secondaryWidth;
  final StrokeCap strokeCap;

  _RadialProgressPainter({
    required this.percentage,
    required this.primaryColor,
    required this.secondaryColor,
    required this.primaryWidth,
    required this.secondaryWidth,
    required this.strokeCap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = secondaryWidth
      ..color = secondaryColor
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint);

    final paintArc = Paint()
      ..strokeWidth = primaryWidth
      ..color = primaryColor
      ..strokeCap = strokeCap
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * math.pi * (percentage / 100);

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
