import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';
import 'package:vkontakte/views/screens/chat_list.dart';
import 'package:vkontakte/views/screens/clips.dart';
import 'package:vkontakte/views/screens/home.dart';

import '../core/providers/theme_provider.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  static List<Widget> widgetOptions = <Widget>[
    Home(),
    ChatList(),
    Clips(),
  ];

  @override
  Widget build(BuildContext context) {
    final brightnessProvider = Provider.of<BrightnessProvider>(context);
    return Scaffold(
      body: widgetOptions[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Symbols.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Symbols.chat_bubble),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Symbols.video_library),
            label: 'Clips',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: brightnessProvider.brightness == Brightness.light &&
                selectedIndex != 2
            ? Colors.blue
            : Colors.white,
        onTap: onItemTapped,
        unselectedItemColor: selectedIndex == 2 ? Colors.white : null,
        backgroundColor: brightnessProvider.brightness == Brightness.dark &&
                selectedIndex != 2
            ? null
            : brightnessProvider.brightness == Brightness.light &&
                    selectedIndex != 2
                ? null
                : Colors.black,
      ),
    );
  }
}
