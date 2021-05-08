import 'package:designs/src/models/layout_model.dart';
import 'package:designs/src/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:designs/src/routes/routes.dart';
import 'package:provider/provider.dart';

class LauncherTabletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    final layoutModel = Provider.of<LayoutModel>(context);
    final colorSchemeSecondary = theme.currentTheme.colorScheme.secondary;
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Designs - Tablet'),
        centerTitle: true,
        backgroundColor: colorSchemeSecondary,
      ),
      drawer: _MainMenu(),
      body: Row(
        children: [
          Container(
              height: double.infinity,
              width: 300,
              child: Column(
                children: [
                  Expanded(child: _Options()),
                  ListTile(
                    leading: Icon(Icons.lightbulb_outline, color: colorSchemeSecondary),
                    title: Text('Dark Mode'),
                    trailing: Switch.adaptive(
                      value: theme.darkTheme,
                      onChanged: (value) => theme.darkTheme = value,
                      activeColor: colorSchemeSecondary,
                    ),
                  ),
                  SafeArea(
                    bottom: true,
                    top: false,
                    left: false,
                    right: false,
                    child: ListTile(
                      leading: Icon(Icons.add_to_home_screen, color: colorSchemeSecondary),
                      title: Text('Custom Theme'),
                      trailing: Switch.adaptive(
                        value: theme.customTheme,
                        onChanged: (value) => theme.customTheme = value,
                        activeColor: colorSchemeSecondary,
                      ),
                    ),
                  ),
                ],
              )),
          Container(
            width: 1,
            height: double.infinity,
            color: theme.darkTheme ? Colors.grey : theme.currentTheme.colorScheme.secondary,
          ),
          Expanded(
            child: layoutModel.currentPage,
          ),
        ],
      ),
    );
  }
}

class _Options extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) => Divider(color: theme.currentTheme.primaryColorLight),
      itemBuilder: (context, index) => ListTile(
        leading: FaIcon(routes[index].icon, color: theme.currentTheme.colorScheme.secondary),
        title: Text(routes[index].title),
        trailing: Icon(Icons.chevron_right, color: theme.currentTheme.colorScheme.secondary),
        onTap: () {
          Provider.of<LayoutModel>(context, listen: false).currentPage = routes[index].page;
          // Navigator.push(context, CupertinoPageRoute(builder: (context) => routes[index].page));
        },
      ),
      itemCount: routes.length,
    );
  }
}

class _MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    final colorSchemeSecondary = theme.currentTheme.colorScheme.secondary;
    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: colorSchemeSecondary,
                  child: Text(
                    'TS',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ),
            Expanded(
              child: _Options(),
            ),
            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: colorSchemeSecondary),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                value: theme.darkTheme,
                onChanged: (value) => theme.darkTheme = value,
                activeColor: colorSchemeSecondary,
              ),
            ),
            SafeArea(
              bottom: true,
              top: false,
              left: false,
              right: false,
              child: ListTile(
                leading: Icon(Icons.add_to_home_screen, color: colorSchemeSecondary),
                title: Text('Custom Theme'),
                trailing: Switch.adaptive(
                  value: theme.customTheme,
                  onChanged: (value) => theme.customTheme = value,
                  activeColor: colorSchemeSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
