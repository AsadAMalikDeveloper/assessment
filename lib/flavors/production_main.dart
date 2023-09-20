import 'package:assesment/flavor_configuration/flavor_configuration_model.dart';
import 'package:assesment/main.dart';
import 'package:flutter/material.dart';

main() {
  baseMain(FlavorConfig()
    ..appTitle = "Production"
    ..apiEndpoint = {
      Endpoints.baseUrl: "production.api/",
      Endpoints.method: "save"
    }
    ..theme = ThemeData.light().copyWith(
        primaryColor: Colors.blue,
        appBarTheme: ThemeData.light()
            .appBarTheme
            .copyWith(backgroundColor: Colors.blueGrey)));
}
