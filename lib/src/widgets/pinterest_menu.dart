import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestMenu extends StatelessWidget {
  final bool show;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;

  PinterestMenu({
    this.show = true,
    this.backgroundColor = Colors.white,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.blueGrey,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _MenuModel(),
      child: Builder(
        builder: (context) {
          Provider.of<_MenuModel>(context, listen: false).activeColor = this.activeColor;
          Provider.of<_MenuModel>(context, listen: false).inactiveColor = this.inactiveColor;
          Provider.of<_MenuModel>(context, listen: false).backgroundColor = this.backgroundColor;

          return AnimatedOpacity(
            opacity: show ? 1 : 0,
            duration: Duration(milliseconds: 250),
            curve: Curves.bounceInOut,
            child: _PinterestMenuBackground(
              child: _MenuItems(menuItems: items),
            ),
          );
        },
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  const _PinterestMenuBackground({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;

    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5,
          ),
        ],
      ),
    );
  }
}

class PinterestButton {
  final Function() onPressed;
  final IconData icon;

  PinterestButton({
    required this.icon,
    required this.onPressed,
  });
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;
  _MenuItems({required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        menuItems.length,
        (index) => _PinterestMenuItem(index: index, item: menuItems[index]),
      ),
    );
  }
}

class _PinterestMenuItem extends StatelessWidget {
  final int index;
  final PinterestButton item;

  _PinterestMenuItem({required this.index, required this.item});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = Provider.of<_MenuModel>(context).selectedIndex;
    final menuModel = Provider.of<_MenuModel>(context);

    return Container(
      child: IconButton(
        splashRadius: 1,
        onPressed: () {
          Provider.of<_MenuModel>(context, listen: false).selectedIndex = index;
          item.onPressed();
        },
        iconSize: (selectedIndex == index) ? 35 : 25,
        icon: Icon(
          item.icon,
          color: (selectedIndex == index) ? menuModel.activeColor : menuModel.inactiveColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _selectedIndex = 0;

  Color _backgroundColor = Colors.white;
  Color _activeColor = Colors.black;
  Color _inactiveColor = Colors.blueGrey;

  int get selectedIndex => this._selectedIndex;
  set selectedIndex(int value) {
    this._selectedIndex = value;
    notifyListeners();
  }

  Color get backgroundColor => this._backgroundColor;
  set backgroundColor(Color value) => this._backgroundColor = value;

  Color get activeColor => this._activeColor;
  set activeColor(Color value) => this._activeColor = value;

  Color get inactiveColor => this._inactiveColor;
  set inactiveColor(Color value) => this._inactiveColor = value;
}
