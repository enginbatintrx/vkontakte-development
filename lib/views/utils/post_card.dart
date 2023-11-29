import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:vkontakte/core/models/test.dart';
import 'package:vkontakte/core/providers/theme_provider.dart';
import 'package:vkontakte/views/utils/post_icon_button.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.color,
    required this.brightnessProvider,
  });

  final Color color;
  final BrightnessProvider brightnessProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: color,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Image.asset("assets/testasset.gif"),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Engin Batin",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: brightnessProvider.brightness ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                          Text(
                            "today at 9:32",
                            style: TextStyle(
                              color: brightnessProvider.brightness ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Symbols.add_box,
                        color: Colors.blue,
                        size: 24,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Symbols.more_vert,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text(
                  "Russian Ukrainen war 2022",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: brightnessProvider.brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 9,
              ),
              Image.asset("assets/tank.jpg"),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        PostIconButton(
                          iconData: Icon(
                            Symbols.favorite,
                            color: brightnessProvider.brightness ==
                                    Brightness.light
                                ? Colors.grey.shade700
                                : Colors.grey,
                          ),
                          sayi: 3800,
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        PostIconButton(
                          iconData: Icon(
                            Symbols.chat_bubble,
                            color: brightnessProvider.brightness ==
                                    Brightness.light
                                ? Colors.grey.shade700
                                : Colors.grey,
                          ),
                          sayi: 44,
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        PostIconButton(
                          iconData: Transform.rotate(
                            angle: 180 * 3.14 / 180,
                            child: Icon(
                              Symbols.reply,
                              color: brightnessProvider.brightness ==
                                      Brightness.light
                                  ? Colors.grey.shade700
                                  : Colors.grey,
                            ),
                          ),
                          sayi: 547,
                        ),
                      ],
                    ),
                    countofviews(sayi: 443234),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  const StoryCard({
    super.key,
    required this.testlist,
    required this.brightnessProvider,
  });

  final List<User> testlist;
  final BrightnessProvider brightnessProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 8, 5, 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                backgroundColor: Colors.deepPurpleAccent,
                radius: 30,
                child: CircleAvatar(
                  child: testlist[0].image,
                  radius: 28,
                ),
              ),
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(360),
                ),
                child: Icon(
                  Icons.add,
                  size: 16,
                  color: brightnessProvider.brightness == Brightness.light
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 3,
          ),
          Flexible(
            child: Text(
              testlist[0].name.length > 11
                  ? '${testlist[0].name.substring(0, 8)}...'
                  : testlist[0].name,
              style: TextStyle(
                color: brightnessProvider.brightness == Brightness.light
                    ? Colors.black
                    : Colors.grey.shade400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
