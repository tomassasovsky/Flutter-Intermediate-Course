import 'package:designs/src/theme/theme.dart';
import 'package:designs/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final color = Provider.of<ThemeChanger>(context).currentTheme.colorScheme.secondary;

    return Scaffold(
      body: WavesHeader(
        color: color,
      ),
    );
  }
}
