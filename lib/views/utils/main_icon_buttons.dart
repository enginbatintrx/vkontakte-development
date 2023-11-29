import 'package:flutter/material.dart';

import '../../core/providers/theme_provider.dart';

IconButton main_icon_buttons(BrightnessProvider brightnessProvider, Icon icon,
    VoidCallback voidCallback) {
  return IconButton(
    onPressed: voidCallback,
    icon: Icon(
      icon.icon,
      color: brightnessProvider.brightness == Brightness.dark
          ? Colors.white
          : Colors.blue,
      size: 28,
    ),
  );
}
