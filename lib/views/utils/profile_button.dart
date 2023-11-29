import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:vkontakte/core/providers/theme_provider.dart';

class profile_high_button extends StatelessWidget {
  String name;
  IconData icon;
  VoidCallback voidCallback;
  profile_high_button({
    required this.name,
    required this.icon,
    required this.voidCallback,
    super.key,
    required this.brightnessProvider,
  });

  final BrightnessProvider brightnessProvider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallback,
      child: Container(
        width: MediaQuery.of(context).size.width - 30,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: brightnessProvider.brightness == Brightness.dark
                    ? Colors.white
                    : Colors.blue.shade600,
                size: 21,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                name,
                style: TextStyle(
                  color: brightnessProvider.brightness == Brightness.dark
                      ? Colors.white
                      : Colors.blue.shade600,
                  fontSize: 15,
                ),
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: brightnessProvider.brightness == Brightness.dark
              ? Colors.grey.shade800
              : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
