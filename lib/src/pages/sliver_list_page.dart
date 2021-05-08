import 'package:designs/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliverListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(
            bottom: -10,
            right: 0,
            child: _ButtonNewList(),
          ),
        ],
      ),
    );
  }
}

class _ButtonNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Provider.of<ThemeChanger>(context);

    return Container(
      width: size.width * 0.9,
      height: 100,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: theme.darkTheme ? theme.currentTheme.colorScheme.secondary : Color(0xffed6762),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
            ),
          ),
        ),
        child: Text(
          'CREATE NEW LIST',
          style: TextStyle(
            color: theme.currentTheme.scaffoldBackgroundColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    final list = [
      _ListItem('Orange', Color(0xffF08F66)),
      _ListItem('Family', Color(0xffF2A38A)),
      _ListItem('Subscriptions', Color(0xffF7CDD5)),
      _ListItem('Books', Color(0xffFCEBAF)),
      _ListItem('Orange', Color(0xffF08F66)),
      _ListItem('Family', Color(0xffF2A38A)),
      _ListItem('Subscriptions', Color(0xffF7CDD5)),
      _ListItem('Books', Color(0xffFCEBAF)),
      _ListItem('Orange', Color(0xffF08F66)),
      _ListItem('Family', Color(0xffF2A38A)),
      _ListItem('Subscriptions', Color(0xffF7CDD5)),
      _ListItem('Books', Color(0xffFCEBAF)),
      _ListItem('Orange', Color(0xffF08F66)),
      _ListItem('Family', Color(0xffF2A38A)),
      _ListItem('Subscriptions', Color(0xffF7CDD5)),
      _ListItem('Books', Color(0xffFCEBAF)),
    ];

    return Scrollbar(
      controller: controller,
      isAlwaysShown: true,
      interactive: true,
      thickness: 10,
      child: CustomScrollView(
        controller: controller,
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            floating: true,
            delegate: _SliverCustomHeaderDelegate(
                minHeight: 170,
                maxHeight: 200,
                child: Container(
                  alignment: Alignment.centerLeft,
                  color: theme.currentTheme.scaffoldBackgroundColor,
                  child: _Header(),
                )),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              ...list,
              SizedBox(height: 100),
            ]),
          ),
        ],
      ),
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: this.child);
  }

  @override
  double get maxExtent => this.maxHeight;

  @override
  double get minExtent => this.minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return this.maxHeight != oldDelegate.maxHeight || this.minHeight != oldDelegate.minHeight || this.child != oldDelegate.child;
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Text(
            'New',
            style: TextStyle(
              color: theme.darkTheme ? Colors.grey : Color(0xff532128),
              fontSize: 50,
            ),
          ),
        ),
        Stack(
          children: [
            SizedBox(width: 100),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                color: theme.darkTheme ? Colors.grey : Color(0xff532128),
              ),
            ),
            Container(
              child: Text(
                'List',
                style: TextStyle(
                  color: Color(0xffd93a30),
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ListItem extends StatelessWidget {
  final String title;
  final Color color;
  const _ListItem(
    this.title,
    this.color, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(30),
      child: Text(
        this.title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      height: 100,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.darkTheme ? Colors.grey : Color(0xff532128),
        // color:  this.color,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
