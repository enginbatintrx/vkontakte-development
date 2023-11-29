import 'package:flutter/material.dart';

class AlbumsPage extends StatefulWidget {
  const AlbumsPage({super.key});

  @override
  State<AlbumsPage> createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      scrollDirection: Axis.horizontal,
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              5,
            ),
          ),
          margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
          child: Stack(
            children: [
              ClipRRect(
                child: Image.asset(
                  "assets/donetsk.png",
                ),
                borderRadius: BorderRadius.circular(
                  5,
                ),
              ),
              Positioned(
                bottom: 4,
                left: 7,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "2 photos",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "Profile photos",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
