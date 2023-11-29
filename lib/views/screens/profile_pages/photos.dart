import 'package:flutter/widgets.dart';

class PhotosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Burada fotoğraf kategorisinin içeriğini göstermek için gerekli widget'ları ekleyin.
    // Örneğin, bir ListView içinde fotoğrafları listeleyebilirsiniz.
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        if (index == 1) {
          return Image.asset(
            "assets/sunset.jpg",
          );
        } else {
          return ClipRRect(
            borderRadius: index == 0
                ? BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
            child: Image.asset(
              "assets/tank.jpg",
            ),
          );
        }
      },
    );
  }
}
