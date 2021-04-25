import 'package:designs/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

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
    final size = MediaQuery.of(context).size;
    final show = Provider.of<_MenuModel>(context).show;

    return Positioned(
      bottom: 30,
      width: size.width,
      child: Container(
        alignment: Alignment.bottomCenter,
        child: PinterestMenu(
          items: [
            PinterestButton(icon: Icons.pie_chart, onPressed: () {}),
            PinterestButton(icon: Icons.search, onPressed: () {}),
            PinterestButton(icon: Icons.notifications, onPressed: () {}),
            PinterestButton(icon: Icons.supervised_user_circle, onPressed: () {}),
          ],
          show: show,
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
    return Container(
      margin: EdgeInsets.all(5),
      child: StaggeredGridView.countBuilder(
        controller: controller,
        physics: BouncingScrollPhysics(),
        crossAxisCount: 4,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return _PinterestItem(index);
        },
        staggeredTileBuilder: (int index) => StaggeredTile.count(2, index.isEven ? 2 : 1),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
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
