import 'package:flutter/material.dart';

enum Flavor { DEV, PRODUCTION }

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final Color color;
  static FlavorConfig? _instance;

  factory FlavorConfig({
    required Flavor flavor,
    Color color = Colors.blue,
  }) {
    _instance ??=
        FlavorConfig._internal(flavor, flavor.toString().split('.')[1], color);
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.name, this.color);
  static FlavorConfig? get instance {
    return _instance;
  }

  static bool isProduction() => _instance!.flavor == Flavor.PRODUCTION;
  static bool isDevelopment() => _instance!.flavor == Flavor.DEV;
}
