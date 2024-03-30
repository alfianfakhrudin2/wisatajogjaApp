import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Themeprov with ChangeNotifier {
  late bool _isDark;

  late SharedPreferences storage;

  Themeprov() {
    _isDark = false;
    init();
  }

  //Custom dark theme
  final darkTheme = ThemeData(
    primaryColor: Colors.black12,
    brightness: Brightness.dark,
    primaryColorDark: Colors.black12,
  );

  //Custom light theme
  final lightTheme = ThemeData(
      primaryColor: const Color.fromARGB(255, 228, 228, 228),
      brightness: Brightness.light,
      primaryColorDark: Colors.white);

  get isDark => _isDark;

  //Now we want to save the last changed theme value

  //Dark mode toggle action
  Future<void> toggleTheme() async {
    _isDark = !_isDark;
    notifyListeners();
    //Save the value to secure storage
    storage.setBool("isDark", _isDark);
  }

  //Init method of provider
  Future<void> init() async {
    //After we re run the app
    storage = await SharedPreferences.getInstance();
    _isDark = storage.getBool("isDark") ?? false;
    notifyListeners();
  }
}
