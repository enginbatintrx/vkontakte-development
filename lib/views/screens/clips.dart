import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Clips extends StatefulWidget {
  @override
  _ClipsState createState() => _ClipsState();
}

class _ClipsState extends State<Clips> with SingleTickerProviderStateMixin {
  late VideoPlayerController _controller;
  late TabController _tabController;
  bool isVideoPlaying = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/tankvid.mp4")
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      });

    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    _controller.play();
                  }
                  isVideoPlaying = !_controller.value.isPlaying;
                });
              },
              child: Center(
                child: Container(
                  height: _controller.value.aspectRatio < 0.65
                      ? MediaQuery.of(context).size.height
                      : null,
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage("assets/testasset.gif"),
                  ),
                ),
                Expanded(
                  child: TabBar(
                    labelPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    unselectedLabelColor: Colors.white70,
                    labelColor: Colors.white,
                    isScrollable: true,
                    dividerColor: Colors.transparent,
                    controller: _tabController,
                    indicatorColor: Colors.white,
                    labelStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    indicatorPadding: EdgeInsets.all(0),
                    tabs: [
                      Tab(text: 'Your Clips'),
                      Tab(text: 'For You'),
                      Tab(text: 'Following'),
                      Tab(text: 'Trending'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ],
            ),
            Positioned(
              left: 16,
              bottom: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        child: Image.asset("assets/testasset.gif"),
                        radius: 15,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Engin",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade600.withOpacity(0.5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "Follow",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    "Subtitle/content",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: VideoProgressIndicator(
                _controller,
                allowScrubbing: true,
                colors: VideoProgressColors(playedColor: Colors.white),
              ),
            ),
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {},
              child: Icon(Icons.favorite, color: Colors.white),
            ),
            Text(
              "29.8K",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {},
              child: Icon(Icons.comment, color: Colors.white),
            ),
            Text(
              "29.8K",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {},
              child: Icon(Icons.reply, color: Colors.white),
            ),
            Text(
              "29.8K",
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: SizedBox(
                child: Divider(),
                width: 38,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Icon(Icons.thumb_down, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
