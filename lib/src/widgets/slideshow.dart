import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> children;
  final bool dotsUp;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBullet;
  final double secondaryBullet;

  const Slideshow({
    Key? key,
    required this.children,
    this.dotsUp = false,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.primaryBullet = 15.0,
    this.secondaryBullet = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideShowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (context) {
              Provider.of<_SlideShowModel>(context, listen: false).primaryColor = this.primaryColor;
              Provider.of<_SlideShowModel>(context, listen: false).secondaryColor = this.secondaryColor;
              Provider.of<_SlideShowModel>(context, listen: false).primaryBullet = this.primaryBullet;
              Provider.of<_SlideShowModel>(context, listen: false).secondaryBullet = this.secondaryBullet;

              return SlideshowStructure(
                dotsUp: dotsUp,
                children: children,
              );
            },
          ),
        ),
      ),
    );
  }
}

class SlideshowStructure extends StatelessWidget {
  const SlideshowStructure({
    Key? key,
    required this.dotsUp,
    required this.children,
  }) : super(key: key);

  final bool dotsUp;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (this.dotsUp) _Dots(this.children.length),
        Expanded(
          child: _Slides(
            children: this.children,
          ),
        ),
        if (!this.dotsUp) _Dots(this.children.length),
      ],
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> children;

  const _Slides({Key? key, required this.children}) : super(key: key);
  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      Provider.of<_SlideShowModel>(context, listen: false).currentPage = pageViewController.page!;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView.builder(
        controller: pageViewController,
        physics: BouncingScrollPhysics(),
        itemCount: widget.children.length,
        itemBuilder: (context, index) {
          return _Slide(widget.children[index]);
        },
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget child;
  const _Slide(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: child,
    );
  }
}

class _Dots extends StatelessWidget {
  final int length;

  const _Dots(this.length, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(length, (index) => _Dot(index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final slideShowModel = Provider.of<_SlideShowModel>(context);
    final bulletSize;
    final color;

    if (slideShowModel.currentPage >= this.index - .5 && slideShowModel.currentPage < this.index + .5) {
      bulletSize = slideShowModel.primaryBullet;
      color = slideShowModel.primaryColor;
    } else {
      bulletSize = slideShowModel.secondaryBullet;
      color = slideShowModel.secondaryColor;
    }

    return AnimatedContainer(
      height: bulletSize,
      width: bulletSize,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      duration: Duration(milliseconds: 300),
      curve: Curves.bounceInOut,
    );
  }
}

class _SlideShowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.grey;
  double _primaryBullet = 15.0;
  double _secondaryBullet = 10.0;

  double get currentPage => this._currentPage;
  set currentPage(double value) {
    this._currentPage = value;
    notifyListeners();
  }

  Color get primaryColor => this._primaryColor;
  set primaryColor(Color color) {
    this._primaryColor = color;
  }

  Color get secondaryColor => this._secondaryColor;
  set secondaryColor(Color color) {
    this._secondaryColor = color;
  }

  double get primaryBullet => this._primaryBullet;
  set primaryBullet(double value) {
    this._primaryBullet = value;
  }

  double get secondaryBullet => this._secondaryBullet;
  set secondaryBullet(double value) {
    this._secondaryBullet = value;
  }
}
