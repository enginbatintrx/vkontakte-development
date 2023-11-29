import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class profile_icon_appbar extends StatelessWidget {
  IconData iconData;
  profile_icon_appbar({
    required this.iconData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          360,
        ),
        color: Colors.black.withOpacity(0.5),
      ),
      padding: EdgeInsets.all(5),
      child: Icon(
        iconData,
        color: Colors.white,
      ),
    );
  }
}
