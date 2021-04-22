import 'package:flutter/material.dart';

class AnimatedSquarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSquare(),
      ),
    );
  }
}

class AnimatedSquare extends StatefulWidget {
  const AnimatedSquare({Key? key}) : super(key: key);

  @override
  _AnimatedSquareState createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<AnimatedSquare> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> toRight;
  late Animation<double> toUp;
  late Animation<double> toLeft;
  late Animation<double> toDown;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 4500));
    toRight = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(parent: controller, curve: Interval(0.0, .25, curve: Curves.bounceOut)));
    toUp = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(parent: controller, curve: Interval(.25, .5, curve: Curves.bounceOut)));
    toLeft = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(parent: controller, curve: Interval(.5, .75, curve: Curves.bounceOut)));
    toDown = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(parent: controller, curve: Interval(.75, 1.0, curve: Curves.bounceOut)));

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) controller.reset();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: Rectangle(),
      builder: (context, child) {
        controller.forward();
        return Transform.translate(
          offset: Offset(toRight.value + toLeft.value, toUp.value + toDown.value),
          child: child,
        );
      },
    );
  }
}

class Rectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
