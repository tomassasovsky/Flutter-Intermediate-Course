import 'package:designs/src/theme/theme.dart';
import 'package:designs/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLarge = (MediaQuery.of(context).size.height > 500);
    final children = [
      Expanded(child: MySlideshow()),
      Expanded(child: MySlideshow()),
    ];
    return Scaffold(
      body: isLarge ? Column(children: children) : Row(children: children),
    );
  }
}

class MySlideshow extends StatelessWidget {
  const MySlideshow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    final colorSchemeSecondary = theme.currentTheme.colorScheme.secondary;

    return Slideshow(
      primaryBullet: 10,
      secondaryBullet: 5,
      primaryColor: theme.darkTheme ? colorSchemeSecondary : Color(0xffff5a7e),
      children: [
        SvgPicture.asset('assets/svg/slide-1.svg'),
        SvgPicture.asset('assets/svg/slide-2.svg'),
        SvgPicture.asset('assets/svg/slide-3.svg'),
        SvgPicture.asset('assets/svg/slide-4.svg'),
        SvgPicture.asset('assets/svg/slide-5.svg'),
        SvgPicture.asset('assets/svg/slide-6.svg'),
      ],
    );
  }
}
