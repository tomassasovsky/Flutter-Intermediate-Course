import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedRectanglePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedRectangle(),
      ),
    );
  }
}

class AnimatedRectangle extends StatefulWidget {
  // AnimatedRectangle({Key? key}) : super(key: key);

  @override
  _AnimatedRectangleState createState() => _AnimatedRectangleState();
}

class _AnimatedRectangleState extends State<AnimatedRectangle> with SingleTickerProviderStateMixin {
  late final controller;
  late final Animation<double> rotation;

  late final Animation<double> opacity;
  late final Animation<double> opacityOut;

  late final Animation<double> position;
  late final Animation<double> size;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000),
    );

    rotation = Tween(begin: 0.0, end: 2.0 * math.pi).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut),
    );

    opacity = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0, .25, curve: Curves.easeOut)),
    );

    opacityOut = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(.75, 1.0, curve: Curves.easeOut)),
    );

    position = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut),
    );

    size = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut),
    );

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) controller.reset();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangle(),
      builder: (BuildContext context, child) {
        return Transform.translate(
          offset: Offset(position.value, 0),
          child: Transform.rotate(
            angle: rotation.value,
            child: Opacity(
              opacity: opacity.value - opacityOut.value,
              child: Transform.scale(
                scale: size.value,
                child: child!,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Rectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
    );
  }
}
