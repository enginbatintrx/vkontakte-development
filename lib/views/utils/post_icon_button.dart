import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';
import 'package:vkontakte/core/providers/theme_provider.dart';

class PostIconButton extends StatelessWidget {
  Widget iconData;
  int sayi;
  PostIconButton({super.key, required this.iconData, required this.sayi});

  @override
  Widget build(BuildContext context) {
    final brightnessProvider = Provider.of<BrightnessProvider>(context);
    String formattedCount = formatNumber(sayi);
    return Container(
      decoration: BoxDecoration(
        color: brightnessProvider.brightness == Brightness.light
            ? Colors.grey.shade300
            : Colors.grey.shade900,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
        child: Row(
          children: [
            iconData,
            SizedBox(
              width: 4,
            ),
            Text(
              formattedCount, // biçimlendirilmiş sayıyı göster
              style: TextStyle(
                color: brightnessProvider.brightness == Brightness.light
                    ? Colors.grey.shade800
                    : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}

class countofviews extends StatelessWidget {
  int sayi;
  countofviews({super.key, required this.sayi});

  @override
  Widget build(BuildContext context) {
    final brightnessProvider = Provider.of<BrightnessProvider>(context);
    String formattedCount2 = formatNumber(sayi);
    return Row(
      children: [
        Icon(Icons.visibility,
            color: brightnessProvider.brightness == Brightness.light
                ? Colors.grey.shade600
                : Colors.grey),
        SizedBox(width: 8), // İkon ile metin arasında boşluk
        Text(
          formattedCount2,
          style: TextStyle(
            color: brightnessProvider.brightness == Brightness.light
                ? Colors.grey.shade600
                : Colors.grey,
          ),
        ),
      ],
    );
  }
}

String formatNumber(int number) {
  if (number >= 1000 && number < 1000000) {
    return '${(number / 1000).toStringAsFixed(1)}K';
  } else if (number >= 1000000) {
    return '${(number / 1000000).toStringAsFixed(1)}M';
  }
  return number.toString();
}
