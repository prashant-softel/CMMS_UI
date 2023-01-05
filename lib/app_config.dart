import 'package:flutter/material.dart';

enum EndPoints {
  item,
  details,
}

class AppConfig {
  String? appTitle;
  Map<EndPoints, String>? apiEndPoint;
  String? imageLocation;
  ThemeData? theme;
  ThemeMode? themeMode;
  int? flavoredApp;
}
