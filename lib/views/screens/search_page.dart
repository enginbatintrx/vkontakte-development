import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:vkontakte/core/providers/theme_provider.dart';

import 'package:vkontakte/views/screens/search/all.dart';
import 'package:vkontakte/views/screens/search/clips.dart';
import 'package:vkontakte/views/screens/search/communities.dart';
import 'package:vkontakte/views/screens/search/people.dart';

class MySearchPage extends StatefulWidget {
  const MySearchPage({Key? key}) : super(key: key);

  @override
  _MySearchPageState createState() => _MySearchPageState();
}

class _MySearchPageState extends State<MySearchPage> {
  List searchs = [
    "All",
    "People",
    "Communities",
    "Clips",
  ];

  @override
  Widget build(BuildContext context) {
    final brightnessProvider = Provider.of<BrightnessProvider>(context);
    Color color = Theme.of(context).backgroundColor;
    return DefaultTabController(
      length: searchs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            decoration: BoxDecoration(
              color: brightnessProvider.brightness == Brightness.light
                  ? Colors.grey[200]
                  : Colors.grey.shade800,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                SizedBox(width: 8),
                Icon(
                  Icons.search,
                  color: brightnessProvider.brightness == Brightness.light
                      ? Colors.grey.shade700
                      : Colors.grey,
                ),
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      fontSize: 16,
                      color: brightnessProvider.brightness == Brightness.light
                          ? Colors.grey.shade700
                          : Colors.grey.shade100,
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(16, 8, 8, 8),
                      border: InputBorder.none,
                      hintText: 'Search',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.alternate_email,
                    color: brightnessProvider.brightness == Brightness.light
                        ? Colors.grey.shade700
                        : Colors.grey,
                  ),
                ),
                SizedBox(width: 12),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.mic,
                    color: brightnessProvider.brightness == Brightness.light
                        ? Colors.grey.shade700
                        : Colors.grey,
                  ),
                ),
                SizedBox(width: 12),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50), // TabBar'ın yüksekliğini ayarla
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.topCenter,
                  child: TabBar(
                    labelColor: brightnessProvider.brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                    unselectedLabelColor:
                        brightnessProvider.brightness == Brightness.dark
                            ? Colors.grey
                            : Colors.grey.shade700,
                    indicatorColor: Colors.blue,
                    indicatorSize: TabBarIndicatorSize.label,
                    dividerColor: color,
                    isScrollable: true,
                    tabs: searchs.map((search) {
                      return Container(
                        child: Tab(
                          child: Text(
                            search,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                  child: Divider(),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(children: [
          AllPage(),
          PeoplesPage(),
          CommunitiesPage(),
          ClipsPage(),
        ]),
      ),
    );
  }
}
