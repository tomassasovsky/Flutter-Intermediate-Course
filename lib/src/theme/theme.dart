import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeChanger({int? theme}) {
    switch (theme) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = light;
        return;
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = dark;
        return;
      case 3:
        _customTheme = true;
        _darkTheme = false;
        _currentTheme = lightcustom;
        return;
      case 4:
        _customTheme = true;
        _darkTheme = true;
        _currentTheme = darkcustom;
        return;
      default:
        throw Exception('No theme was selected');
    }
  }

  bool _darkTheme = false;
  bool _customTheme = false;

  late ThemeData _currentTheme;

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;

  set darkTheme(bool value) {
    _darkTheme = value;

    if (_darkTheme) {
      if (_customTheme)
        _currentTheme = darkcustom;
      else
        _currentTheme = dark;
    } else {
      if (_customTheme)
        _currentTheme = lightcustom;
      else
        _currentTheme = light;
    }
    notifyListeners();
  }

  set customTheme(bool value) {
    _customTheme = value;

    if (_darkTheme) {
      if (_customTheme)
        _currentTheme = darkcustom;
      else
        _currentTheme = dark;
    } else {
      if (customTheme)
        _currentTheme = lightcustom;
      else
        _currentTheme = light;
    }
    notifyListeners();
  }
}

final darkcustom = ThemeData.dark().copyWith(
  colorScheme: ColorScheme.dark().copyWith(
    secondary: Color(0xff48a0eb),
  ),
  primaryColorLight: Colors.white,
  scaffoldBackgroundColor: Color(0xff16202b),
  // textTheme: TextTheme(
  //   bodyText2: TextStyle(color: Colors.white),
  // ),
);

final lightcustom = ThemeData.light().copyWith(
  colorScheme: ColorScheme.light().copyWith(
    secondary: Color(0xff48a0eb),
  ),
  primaryColorLight: Colors.black,
  scaffoldBackgroundColor: Colors.white,
);

final dark = ThemeData.dark().copyWith(
  colorScheme: ColorScheme.dark().copyWith(
    secondary: Colors.pink,
  ),
);

final light = ThemeData.light().copyWith(
  colorScheme: ColorScheme.light().copyWith(
    secondary: Colors.pink,
  ),
);
