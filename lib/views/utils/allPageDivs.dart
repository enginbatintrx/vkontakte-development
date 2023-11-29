import 'package:flutter/material.dart';
import 'package:vkontakte/core/providers/theme_provider.dart';

class allpageDivs extends StatelessWidget {
  String title;
  allpageDivs({
    super.key,
    required this.brightnessProvider,
    required this.title,
  });

  final BrightnessProvider brightnessProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(26, 0, 13, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: brightnessProvider.brightness == Brightness.dark
                  ? Colors.grey
                  : Colors.grey.shade700,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Show All",
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
