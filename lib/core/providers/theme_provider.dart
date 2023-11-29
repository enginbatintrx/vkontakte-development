import 'package:flutter/material.dart';

class BrightnessProvider extends ChangeNotifier {
  Brightness _brightness = Brightness.dark;
//SchedulerBinding.instance.platformDispatcher.platformBrightness
  Brightness get brightness => _brightness;

  setBrightness(Brightness newBrightness) {
    _brightness = newBrightness;
    notifyListeners();
  }
}
