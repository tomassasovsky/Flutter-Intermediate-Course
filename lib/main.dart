import 'package:flutter/material.dart';

import 'package:designs/src/pages/sliver_list_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Designs',
      debugShowCheckedModeBanner: false,
      home: SliverListPage(),
    );
  }
}
