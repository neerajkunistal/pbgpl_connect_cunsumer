import 'package:flutter/material.dart';

@immutable
class EnvironmentConfig extends InheritedWidget {
  final EnvironmentFlavours flavours;

  const EnvironmentConfig({
    super.key,
    required this.flavours,
    required super.child,
  });

  static EnvironmentConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    throw false;
  }

  String get generalUrlBaseOnFlavour {
    switch (flavours) {
      case EnvironmentFlavours.productionPBGPL:
        return "https://pbgpl.smartgasnet.com/";
      case EnvironmentFlavours.developmentPBGPL:
        return "http://142.79.231.30:9097/";
    }
  }
}

enum EnvironmentFlavours { productionPBGPL, developmentPBGPL }
