import 'package:designs/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:designs/src/widgets/pinterest_menu.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: [
            PinterestGrid(),
            _PinterestMenuLocated(),
          ],
        ),
      ),
    );
  }
}

class _PinterestMenuLocated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final show = Provider.of<_MenuModel>(context).show;
    final theme = Provider.of<ThemeChanger>(context).currentTheme;
    double width = MediaQuery.of(context).size.width;

    if (width > 500) {
      width = width - 300;
    }

    return Positioned(
      bottom: 30,
      child: Container(
        width: width,
        child: Row(
          children: [
            Spacer(),
            PinterestMenu(
              backgroundColor: theme.scaffoldBackgroundColor,
              activeColor: theme.colorScheme.secondary,
              show: show,
              items: [
                PinterestButton(icon: Icons.pie_chart, onPressed: () {}),
                PinterestButton(icon: Icons.search, onPressed: () {}),
                PinterestButton(icon: Icons.notifications, onPressed: () {}),
                PinterestButton(icon: Icons.supervised_user_circle, onPressed: () {}),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  List<int> items = List.generate(200, (index) => index);
  final controller = ScrollController();
  double previousOffset = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.offset > previousOffset && controller.offset > 10) {
        Provider.of<_MenuModel>(context, listen: false).show = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).show = true;
      }
      previousOffset = controller.offset;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLarge = MediaQuery.of(context).size.height > 500;
    int count = isLarge ? 3 : 2;
    return Container(
      margin: EdgeInsets.all(5),
      child: Scrollbar(
        thickness: 10,
        isAlwaysShown: true,
        interactive: true,
        controller: controller,
        child: StaggeredGridView.countBuilder(
          controller: controller,
          physics: BouncingScrollPhysics(),
          crossAxisCount: count,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return _PinterestItem(index);
          },
          staggeredTileBuilder: (int index) => StaggeredTile.count(1, index.isEven ? 1 : 2),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
      ),
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;
  const _PinterestItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      margin: EdgeInsets.all(2.5),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('${this.index}'),
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _show = true;

  bool get show => this._show;
  set show(bool value) {
    this._show = value;
    notifyListeners();
  }
}
