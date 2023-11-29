import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:vkontakte/core/providers/theme_provider.dart';

Container profile_button_helper(
    Color color, BrightnessProvider brightnessProvider, Widget child) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: color,
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
      child: child,
    ),
  );
}
