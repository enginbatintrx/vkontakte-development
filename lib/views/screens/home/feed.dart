import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';
import 'package:vkontakte/core/models/test.dart';
import 'package:vkontakte/views/utils/post_card.dart';

import '../../../core/providers/theme_provider.dart';
import '../../utils/post_icon_button.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  List<User> testlist = [
    User(
      image: Image.asset("assets/testasset.gif"),
      name: "Engin Batın Yılmaz",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).backgroundColor;
    final brightnessProvider = Provider.of<BrightnessProvider>(context);
    return Scaffold(
      backgroundColor: brightnessProvider.brightness == Brightness.light
          ? Colors.black12
          : Colors.black,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: brightnessProvider.brightness == Brightness.dark
                    ? color
                    : Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: ListView.builder(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return StoryCard(testlist: testlist, brightnessProvider: brightnessProvider);
                },
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ListView.builder(
              padding: EdgeInsets.all(5),
              itemBuilder: (context, index) {
                return PostCard(color: color, brightnessProvider: brightnessProvider);
              },
            ),
          ),
        ],
      ),
    );
  }
}

