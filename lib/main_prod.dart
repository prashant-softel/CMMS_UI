import 'package:cmms/app_config.dart';
import 'package:cmms/common_main.dart';
import 'package:flutter/material.dart';

void main() {
  var config = AppConfig()
    ..appTitle = 'cmms'
    ..themeMode = ThemeMode.light
    ..flavoredApp = 2;
  mainCommon(config);
}
