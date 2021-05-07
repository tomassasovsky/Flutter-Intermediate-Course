import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SlideButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Color> colors;
  final Function()? onTap;

  const SlideButton({
    required this.title,
    required this.icon,
    this.colors = const [const Color(0xff6989f5), const Color(0xff906ef5)],
    this.onTap,
    Key? key,
  })  : assert(colors.length >= 2, 'There must be at least two colors'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Stack(
        children: [
          _SlideButtonBackground(colors: this.colors, icon: this.icon),
          Row(
            children: [
              SizedBox(height: 140, width: 40),
              FaIcon(this.icon, color: Colors.white, size: 40),
              SizedBox(width: 20),
              Expanded(child: Text(this.title, style: TextStyle(color: Colors.white, fontSize: 18))),
              FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
              SizedBox(width: 40),
            ],
          ),
        ],
      ),
    );
  }
}

class _SlideButtonBackground extends StatelessWidget {
  final IconData icon;
  final List<Color> colors;

  const _SlideButtonBackground({
    required this.icon,
    required this.colors,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                this.icon,
                size: 150,
                color: Colors.white.withOpacity(.2),
              ),
            ),
          ],
        ),
      ),
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.red,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.2), offset: Offset(4, 4), blurRadius: 10),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: this.colors,
        ),
      ),
    );
  }
}
