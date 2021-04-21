import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _WavesHeaderPainter(),
      ),
    );
  }
}

class _WavesHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // properties
    paint.color = Color(0xff615aab);
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
