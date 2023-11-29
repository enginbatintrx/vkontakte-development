import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vkontakte/core/models/branchButton.dart';
import 'package:vkontakte/core/providers/theme_provider.dart';

import 'package:vkontakte/views/screens/profile_pages/albums.dart';
import 'package:vkontakte/views/screens/profile_pages/clips.dart';
import 'package:vkontakte/views/screens/profile_pages/photos.dart';
import 'package:vkontakte/views/screens/search/clips.dart';
import 'package:vkontakte/views/utils/branch_button.dart';
import 'package:vkontakte/views/utils/icon_appbar_profile.dart';
import 'package:vkontakte/views/utils/post_card.dart';
import 'package:vkontakte/views/utils/profile_button.dart';
import 'package:vkontakte/views/utils/profile_button_helper.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<branchButton> branchButtons = [
    branchButton(
      buttonIcon: Symbols.photo,
      buttonName: "Photos",
      createAny: "Upload Photos",
      onTap: () {
        print("Photos düğmesine tıklandı.");
      },
      showAll: () {
        print("showall düğmesine tıklandı.");
      },
    ),
    branchButton(
      buttonIcon: Symbols.photo_library,
      buttonName: "Albums",
      createAny: "Create Album",
      onTap: () {
        print("Albums düğmesine tıklandı.");
      },
      showAll: () {
        print("showall düğmesine tıklandı.");
      },
    ),
    branchButton(
      buttonIcon: Symbols.video_library,
      buttonName: "Clips",
      createAny: "Create Clip",
      onTap: () {
        print("Clips düğmesine tıklandı.");
      },
      showAll: () {
        print("showall düğmesine tıklandı.");
      },
    ),
  ];

  bool isSelected = false;
  int selectedButtonIndex = 0;
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final brightnessProvider = Provider.of<BrightnessProvider>(context);
    Widget selectedPage;
    switch (selectedButtonIndex) {
      case 0:
        selectedPage = PhotosPage();
        break;
      case 1:
        selectedPage = AlbumsPage();
        break;
      case 2:
        selectedPage = ClipsPageProf();
        break;
      default:
        selectedPage = Container();
    }

    Color color = Theme.of(context).backgroundColor;
    return Scaffold(
      backgroundColor: brightnessProvider.brightness == Brightness.dark
          ? Colors.black
          : Colors.grey.shade300,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 320,
            pinned: true,
            floating: false,
            snap: false,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Symbols.arrow_back,
                color: Colors.white,
                size: 27,
              ),
            ),
            actions: [
              profile_icon_appbar(
                iconData: Symbols.widgets,
              ),
              SizedBox(
                width: 9,
              ),
              profile_icon_appbar(
                iconData: Symbols.more_vert,
              ),
              SizedBox(
                width: 9,
              ),
            ],
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final double statusBarHeight =
                    MediaQuery.of(context).padding.top;
                final double appBarHeight = kToolbarHeight + statusBarHeight;
                final double visibleMainHeight =
                    constraints.maxHeight - appBarHeight;
                final double flexibleSpaceHeight =
                    visibleMainHeight.clamp(0.0, double.infinity);

                return Container(
                  color: brightnessProvider.brightness == Brightness.dark
                      ? Colors.black
                      : Colors.grey.shade300,
                  child: Stack(
                    children: [
                      FlexibleSpaceBar(
                        background: flexibleSpaceHeight > 50.0
                            ? Stack(
                                children: [
                                  Image.asset(
                                    "assets/donetsk.png",
                                    height: MediaQuery.of(context).size.height -
                                        680,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              )
                            : null,
                        title: flexibleSpaceHeight < 250.0
                            ? Text(
                                'id028939832',
                                style: TextStyle(color: Colors.white),
                              )
                            : null,
                      ),
                      Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              height: 200,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  ),
                                  color: color,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 110,
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 53,
                                    backgroundColor:
                                        brightnessProvider.brightness ==
                                                Brightness.dark
                                            ? Colors.black
                                            : Colors.white,
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundImage:
                                          AssetImage("assets/testasset.gif"),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 9,
                                  ),
                                  Text(
                                    "Engin Batin Yilmaz",
                                    style: TextStyle(
                                      fontSize: 23,
                                      color: brightnessProvider.brightness ==
                                              Brightness.dark
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 9,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Add personel information",
                                        style: TextStyle(
                                          color: Colors.blue,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Icon(
                                        Symbols.arrow_circle_right,
                                        color: Colors.blue,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  profile_high_button(
                                    name: "Post",
                                    icon: Symbols.add_circle,
                                    voidCallback: () {
                                      print(flexibleSpaceHeight);
                                    },
                                    brightnessProvider: brightnessProvider,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    profile_button_helper(
                      color,
                      brightnessProvider,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Symbols.person_add,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "You haven't added any friends yet",
                                style: TextStyle(
                                  color: brightnessProvider.brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Add friends",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: color,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 35,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: branchButtons.length,
                                itemBuilder: (BuildContext context, int index) {
                                  bool isSelected =
                                      (index == selectedButtonIndex);
                                  print(selectedButtonIndex);
                                  return BranchButton(
                                    buttonName: branchButtons[index].buttonName,
                                    buttonIcon: branchButtons[index].buttonIcon,
                                    isSelected: isSelected,
                                    voidCallback: () {
                                      setState(() {
                                        selectedButtonIndex = index;
                                      });
                                    },
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: selectedButtonIndex == 2 ? 200 : 100,
                              child: selectedPage,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap:
                                      branchButtons[selectedButtonIndex].onTap,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 17,
                                      ),
                                      SizedBox(
                                        width: 9,
                                      ),
                                      Text(
                                        branchButtons[selectedButtonIndex]
                                            .createAny,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color:
                                              brightnessProvider.brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Container(
                                  color: brightnessProvider.brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1,
                                  height: 18,
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                GestureDetector(
                                  onTap: branchButtons[selectedButtonIndex]
                                      .showAll,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Show all",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color:
                                              brightnessProvider.brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 9,
                                      ),
                                      Transform.rotate(
                                        child: Icon(
                                          Icons.arrow_back_ios,
                                          size: 17,
                                        ),
                                        angle: 3.14159265359,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: color,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                        child: profile_high_button(
                          name: "Create post",
                          icon: Symbols.edit_square,
                          voidCallback: () {
                            print("create post");
                          },
                          brightnessProvider: brightnessProvider,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      padding: EdgeInsets.only(top: 6, bottom: 7),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return PostCard(
                            color: color,
                            brightnessProvider: brightnessProvider,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
