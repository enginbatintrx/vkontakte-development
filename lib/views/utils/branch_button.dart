import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class BranchButton extends StatelessWidget {
  String buttonName;
  IconData buttonIcon;
  bool isSelected;
  VoidCallback voidCallback;

  BranchButton({
    required this.buttonIcon,
    required this.buttonName,
    required this.voidCallback,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: voidCallback,
      child: Container(
        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.grey.shade800.withOpacity(0.3)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
          child: Row(
            children: [
              Icon(
                buttonIcon,
              ),
              SizedBox(
                width: 5,
              ),
              Text(buttonName),
            ],
          ),
        ),
      ),
    );
  }
}
