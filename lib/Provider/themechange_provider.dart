import 'package:flutter/material.dart';

class FoodItemsproviderchange with ChangeNotifier {
  ThemeData _themeData;

  FoodItemsproviderchange(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }
}
