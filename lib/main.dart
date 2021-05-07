import 'package:designs/src/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:designs/src/pages/launcher_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeChanger(theme: 2),
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
      home: LauncherPage(),
    );
  }
}
