import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ClipsPageProf extends StatefulWidget {
  const ClipsPageProf({super.key});

  @override
  State<ClipsPageProf> createState() => _ClipsPageProfState();
}

class _ClipsPageProfState extends State<ClipsPageProf> {
  late List<VideoPlayerController> _controllers;
  List<String> localVideoPaths = [
    "assets/clipsvid.mp4",
    "assets/tankvid.mp4",
    "assets/tankvid.mp4",
    "assets/tankvid.mp4",
  ];

  @override
  void initState() {
    super.initState();
    _controllers = localVideoPaths.map((path) {
      final controller = VideoPlayerController.asset(path);
      controller.initialize().then((_) {
        if (mounted) {
          setState(() {});
        }
      });
      return controller;
    }).toList();
  }

  @override
  void dispose() {
    super.dispose();
    _controllers.forEach((controller) => controller.dispose());
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      scrollDirection: Axis.horizontal,
      itemCount: localVideoPaths.length,
      itemBuilder: (BuildContext context, int index) {
        final controller = _controllers[index];
        if (controller.value.isInitialized) {
          return Container(
            decoration: BoxDecoration(
              color: controller.value.aspectRatio < 0.65 ? null : Colors.black,
              borderRadius: index == 0
                  ? BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    )
                  : (index == localVideoPaths.length - 1
                      ? BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )
                      : BorderRadius.zero),
            ),
            width: controller.value.aspectRatio > 0.65 ? 100 : null,
            child: ClipRRect(
              borderRadius: index == 0
                  ? BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    )
                  : (index == localVideoPaths.length - 1
                      ? BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )
                      : BorderRadius.zero),
              child: Center(
                child: AspectRatio(
                  aspectRatio: controller.value.aspectRatio < 0.65
                      ? controller.value.aspectRatio
                      : 16 / 9,
                  child: VideoPlayer(controller),
                ),
              ),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
