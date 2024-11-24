import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final _box = GetStorage();
  final _key = "isDarkMode";
  bool _loadThemeFromBox() => _box.read(_key) ?? false;
  ThemeData get theme =>
      _loadThemeFromBox() ? ThemeData.dark() : ThemeData.light();
  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light);
    _saveThemeToBox(!_loadThemeFromBox());
  }
}