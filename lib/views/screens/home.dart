import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';
import 'package:vkontakte/views/screens/home/feed.dart';
import 'package:vkontakte/views/screens/home/for_you.dart';
import 'package:vkontakte/views/utils/main_appbar.dart';

import '../../core/providers/theme_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final brightnessProvider = Provider.of<BrightnessProvider>(context);
    return Scaffold(
      backgroundColor: brightnessProvider.brightness == Brightness.light
          ? Colors.white
          : null,
      appBar: mainTabAppBar(
        brightnessProvider,
        "Home",
        Symbols.add_circle,
        Symbols.search,
        Symbols.notifications,
        () {},
        () {
          Navigator.pushNamed(context, '/searchPage');
        },
        () {},
        () {
          Navigator.pushNamed(context, '/profilePage');
        },
      ),
      body: DefaultTabController(
        animationDuration: Duration(milliseconds: 500),
        length: 2,
        child: Column(
          children: [
            TabBar(
              unselectedLabelColor:
                  brightnessProvider.brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
              labelColor: brightnessProvider.brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
              indicatorColor: Colors.blue,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              labelStyle: TextStyle(
                fontSize: 18,
              ),
              tabs: [
                Tab(text: "Feed"),
                Tab(text: "For you"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Feed(),
                  ForYou(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
