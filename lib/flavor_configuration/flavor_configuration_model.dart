import 'package:flutter/material.dart';

enum Endpoints { baseUrl, method }


class FlavorConfig {
  String appTitle;
  Map<Endpoints, String>? apiEndpoint;
  ThemeData? theme;

  FlavorConfig({
    this.appTitle = "Assessment",
  }) {
    theme = ThemeData.light();
  }
}