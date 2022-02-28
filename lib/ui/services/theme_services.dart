import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class ThemeService {
  final _box = GetStorage();
  final _key = 'isDarkTheme';

  _saveThemeBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  // ignore: unused_element
  bool _loadTheme() => _box.read(_key) ?? false;
  ThemeMode get theme => _loadTheme() ? ThemeMode.dark : ThemeMode.light;

  void themeSwitch() {
    Get.changeThemeMode(_loadTheme() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeBox(
        !_loadTheme()); //loadTheme sempre retorna falso, o diferente disso retorna o tema light
  }
}
