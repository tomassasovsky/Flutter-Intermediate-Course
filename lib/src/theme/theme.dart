import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeChanger({int? theme}) {
    switch (theme) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        return;
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        return;
      case 3:
        _customTheme = true;
        _darkTheme = false;
        return;
      default:
        throw Exception('No theme was selected');
    }
  }

  bool _darkTheme = false;
  bool _customTheme = false;

  late ThemeData _currentTheme = ThemeData.light();

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;

  set darkTheme(bool value) {
    _darkTheme = value;

    if (_customTheme) {
      if (value)
        _currentTheme = ThemeData.dark().copyWith(
          colorScheme: ColorScheme.dark().copyWith(
            secondary: Color(0xff48a0eb),
          ),
          primaryColorLight: Colors.white,
          scaffoldBackgroundColor: Color(0xff16202b),
          textTheme: TextTheme(
            bodyText2: TextStyle(color: Colors.white),
          ),
        );
      else
        _currentTheme = ThemeData.light().copyWith(
          colorScheme: ColorScheme.dark().copyWith(
            secondary: Colors.purple,
          ),
          primaryColorLight: Colors.black,
          scaffoldBackgroundColor: Colors.white,
        );
    } else {
      if (value)
        _currentTheme = ThemeData.dark();
      else
        _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }

  set customTheme(bool value) {
    _customTheme = value;

    if (_darkTheme) {
      if (value)
        _currentTheme = ThemeData.dark().copyWith(
          colorScheme: ColorScheme.dark().copyWith(
            secondary: Color(0xff48a0eb),
          ),
          primaryColorLight: Colors.white,
          scaffoldBackgroundColor: Color(0xff16202b),
          textTheme: TextTheme(
            bodyText2: TextStyle(color: Colors.white),
          ),
        );
      else
        _currentTheme = ThemeData.dark();
    } else {
      if (value)
        _currentTheme = ThemeData.light().copyWith(
          colorScheme: ColorScheme.light().copyWith(
            secondary: Colors.purple,
          ),
          primaryColorLight: Colors.black,
          scaffoldBackgroundColor: Colors.white,
        );
      else
        _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }
}
