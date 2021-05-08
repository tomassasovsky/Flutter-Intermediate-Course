import 'package:designs/src/models/layout_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:designs/src/pages/launcher_page.dart';
import 'package:designs/src/pages/launcher_tablet_page.dart';
import 'package:designs/src/theme/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeChanger>(create: (_) => ThemeChanger(theme: 2)),
        ChangeNotifierProvider<LayoutModel>(create: (_) => LayoutModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      title: 'Designs',
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          final screenSize = MediaQuery.of(context).size;
          if (screenSize.width > 500) {
            return LauncherTabletPage();
          }
          return LauncherPage();
        },
      ),
    );
  }
}
