import 'package:flutter/material.dart';
import 'package:vkontakte/core/providers/theme_provider.dart';
import 'package:vkontakte/views/utils/main_icon_buttons.dart';

AppBar mainAppBar(BrightnessProvider brightnessProvider, String title,
    IconData icon1, IconData icon2, IconData icon3) {
  return AppBar(
    title: Row(
      children: [
        CircleAvatar(
          radius: 15,
          child: Image.asset(
            "assets/testasset.gif",
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
    actions: [
      main_icon_buttons(brightnessProvider, Icon(icon1), () {}),
      main_icon_buttons(brightnessProvider, Icon(icon2), () {}),
      main_icon_buttons(brightnessProvider, Icon(icon3), () {}),
    ],
  );
}

AppBar mainTabAppBar(
  BrightnessProvider brightnessProvider,
  String title,
  IconData icon1,
  IconData icon2,
  IconData icon3,
  VoidCallback voidCallback1,
  VoidCallback voidCallback2,
  VoidCallback voidCallback3,
  VoidCallback nav,
) {
  return AppBar(
    backgroundColor:
        brightnessProvider.brightness == Brightness.light ? Colors.white : null,
    title: Row(
      children: [
        GestureDetector(
          onTap: nav,
          child: CircleAvatar(
            radius: 15,
            child: Image.asset(
              "assets/testasset.gif",
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
    actions: [
      main_icon_buttons(brightnessProvider, Icon(icon1), voidCallback1),
      main_icon_buttons(brightnessProvider, Icon(icon2), voidCallback2),
      main_icon_buttons(brightnessProvider, Icon(icon3), voidCallback3),
    ],
  );
}
