import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:vkontakte/core/providers/theme_provider.dart';
import 'package:vkontakte/views/utils/allPageDivs.dart';

class AllPage extends StatefulWidget {
  const AllPage({super.key});

  @override
  State<AllPage> createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/tankvid.mp4")
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightnessProvider = Provider.of<BrightnessProvider>(context);
    return Column(
      children: [
        allpageDivs(
          brightnessProvider: brightnessProvider,
          title: "COMMUNİTİES",
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(32, 4, 16, 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          child: Image.asset(
                            "assets/testasset.gif",
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "PMC Wagner",
                              style: TextStyle(
                                  color: brightnessProvider.brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 17),
                            ),
                            Text(
                              "Military arts, ${23} followers",
                              style: TextStyle(
                                color: brightnessProvider.brightness ==
                                        Brightness.dark
                                    ? Colors.grey
                                    : Colors.grey.shade700,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Symbols.add_box,
                        color: Colors.blue,
                        size: 28,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
          child: Divider(),
        ),
        allpageDivs(
          brightnessProvider: brightnessProvider,
          title: "CLİPS",
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: _controller.value.aspectRatio < 0.65
                      ? null
                      : Colors.black,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio < 0.65
                          ? _controller.value.aspectRatio
                          : 16 / 9,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}
