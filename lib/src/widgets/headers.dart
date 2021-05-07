import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SquaredHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615aab),
    );
  }
}

class RoundedBordersHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xff615aab),
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(30),
          right: Radius.circular(30),
        ),
      ),
    );
  }
}

class DiagonalHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615aab),
      child: CustomPaint(
        painter: _DiagonalHeaderPainter(),
      ),
    );
  }
}

class _DiagonalHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // properties
    paint.color = Color(0xff615aab);
    // paint.style = PaintingStyle.stroke;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();

    // draw with path and paint
    path
      ..moveTo(0, size.height * .35)
      ..lineTo(size.width, size.height * .3)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class TriangularHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615aab),
      child: CustomPaint(
        painter: _TriangularHeaderPainter(),
      ),
    );
  }
}

class _TriangularHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // properties
    paint.color = Color(0xff615aab);
    // paint.style = PaintingStyle.stroke;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();

    // draw with path and paint
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class PeakHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _PeakHeaderPainter(),
      ),
    );
  }
}

class _PeakHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // properties
    paint.color = Color(0xff615aab);
    // paint.style = PaintingStyle.stroke;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();

    // draw with path and paint
    path.lineTo(0, size.height * .25);
    path.lineTo(size.width * .5, size.height * .3);
    path.lineTo(size.width, size.height * .25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CurvedHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _CurvedHeaderPainter(),
      ),
    );
  }
}

class _CurvedHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // properties
    paint.color = Color(0xff615aab);
    // paint.style = PaintingStyle.stroke;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();

    // draw with path and paint
    path.lineTo(0, size.height * .25);
    path.quadraticBezierTo(size.width * .5, size.height * .4, size.width, size.height * .25);
    path.lineTo(size.width, 0);
    // path.lineTo(size.width, size.height * .25);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class WavesHeader extends StatelessWidget {
  final Color color;
  final bool showBottom;
  const WavesHeader({required this.color, this.showBottom = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _WavesHeaderPainter(color: this.color, showBottom: this.showBottom),
      ),
    );
  }
}

class _WavesHeaderPainter extends CustomPainter {
  final Color color;
  final bool showBottom;
  const _WavesHeaderPainter({required this.color, required this.showBottom});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // properties
    paint.color = this.color; // Color(0xff615aab);
    // paint.style = PaintingStyle.stroke;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();
    final path2 = Path();

    // draw with path and paint
    path.lineTo(0, size.height * .25);
    path.quadraticBezierTo(size.width * .25, size.height * .3, size.width * .5, size.height * .25);
    path.quadraticBezierTo(size.width * .75, size.height * .2, size.width, size.height * .25);
    path.lineTo(size.width, 0);

    if (showBottom) {
      path2.moveTo(0, size.height);
      path2.lineTo(0, size.height * .75);
      path2.quadraticBezierTo(size.width * .25, size.height * .8, size.width * .5, size.height * .75);
      path2.quadraticBezierTo(size.width * .75, size.height * .7, size.width, size.height * .75);
      path2.lineTo(size.width, size.height);
    }
    canvas.drawPath(path, paint);
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class WavesGradientHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _WavesGradientHeaderHeaderPainter(),
      ),
    );
  }
}

class _WavesGradientHeaderHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCircle(center: Offset(350, 150), radius: 180);
    final gradient = LinearGradient(
      colors: [
        Color(0xff6d05e8),
        Color(0xffc012ff),
        // Color(0xff6d05fa),
      ],
    );
    final paint = Paint()..shader = gradient.createShader(rect);

    // properties
    // paint.color = Color(0xff615aab);
    // paint.style = PaintingStyle.stroke;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = Path();
    final path2 = Path();

    // draw with path and paint
    path.lineTo(0, size.height * .25);
    path.quadraticBezierTo(size.width * .25, size.height * .3, size.width * .5, size.height * .25);
    path.quadraticBezierTo(size.width * .75, size.height * .2, size.width, size.height * .25);
    path.lineTo(size.width, 0);

    path2.moveTo(0, size.height);
    path2.lineTo(0, size.height * .75);
    path2.quadraticBezierTo(size.width * .25, size.height * .8, size.width * .5, size.height * .75);
    path2.quadraticBezierTo(size.width * .75, size.height * .7, size.width, size.height * .75);
    path2.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final List<Color> colors;

  IconHeader({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.colors = const [Color(0xff526BF6), Color(0xff67ACF2)],
  }) : assert(colors.length >= 2, 'There must be at least two colors');

  @override
  Widget build(BuildContext context) {
    final Color whiteBlend = Colors.white.withOpacity(.2);
    final Color white = Colors.white.withOpacity(.7);
    return Stack(
      children: [
        _IconHeaderBackground(colors: this.colors),
        Positioned(
          child: FaIcon(
            this.icon,
            size: 250,
            color: whiteBlend,
          ),
          top: -50,
          left: -70,
        ),
        Column(
          children: [
            SizedBox(height: 80, width: double.infinity),
            Text(this.subtitle, style: TextStyle(fontSize: 20, color: white)),
            Text(this.title, style: TextStyle(fontSize: 25, color: white, fontWeight: FontWeight.bold)),
            SizedBox(height: 20, width: double.infinity),
            FaIcon(this.icon, size: 80, color: white),
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  const _IconHeaderBackground({Key? key, required this.colors}) : super(key: key);

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: this.colors,
        ),
      ),
    );
  }
}
