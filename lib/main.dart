import 'package:assesment/flavor_configuration/flavor_configuration_model.dart';
import 'package:assesment/screens/dynamic_text_field_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var flavorConfigProvider;

void baseMain(FlavorConfig flavorConfig) {
  flavorConfigProvider = StateProvider((ref) => flavorConfig);
  runApp(ProviderScope(child: MyAPP()));
}

class MyAPP extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final config = ref.read(flavorConfigProvider);
    return MaterialApp(
      title: config.appTitle ?? '',
      theme: config.theme,
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends ConsumerWidget {

  @override
  Widget build(BuildContext context, ref) {

    return Scaffold(
      appBar: AppBar(
        title: Text(ref.read(flavorConfigProvider).appTitle ?? '',)
      ),
      body: DynamicEditTextScreen(),
    );
  }
}
