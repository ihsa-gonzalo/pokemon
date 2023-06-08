import 'dart:math';

import 'package:flutter/material.dart';

class BackgroundProvider extends ChangeNotifier {
  String _background = "assets/images/fondo.png";

  String get background => _background;

  List<String> backgrounds = [
    "assets/images/fondo.png",
    "assets/images/background_night.png",
    "assets/images/background_forest.png",
    "assets/images/background_sea.png",
    "assets/images/background_city.png"
  ];

  void setBackground() {
    int intValue = Random().nextInt(backgrounds.length) + 0;
    _background = backgrounds[intValue];
    print(_background);
    notifyListeners();
  }
}
