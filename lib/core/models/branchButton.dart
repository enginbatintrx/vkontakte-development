import 'package:flutter/material.dart';

class branchButton {
  String buttonName;
  IconData buttonIcon;
  VoidCallback showAll = () {};
  VoidCallback onTap;
  String createAny;
  branchButton(
      {required this.buttonIcon,
      required this.buttonName,
      required this.createAny,
      required this.onTap,
      required this.showAll});
}
