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
      case EnvironmentFlavours.developmentNMP:
        return "https://nmpplstations1.smartgasnet.com/";
      case EnvironmentFlavours.developmentPBGPL:
        return "https://pbgpluat.smartgasnet.com/";
      case EnvironmentFlavours.productionMGL:
        return "https://mgl.smartgasnet.com/";
      case EnvironmentFlavours.developmentMGL:
        return "https://mglut.smartgasnet.com/";
    }
  }
}

enum EnvironmentFlavours { productionPBGPL, developmentPBGPL, developmentNMP, productionMGL, developmentMGL }
