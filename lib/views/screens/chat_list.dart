import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';
import 'package:vkontakte/core/models/test.dart';
import 'package:vkontakte/core/providers/theme_provider.dart';
import 'package:vkontakte/views/utils/main_appbar.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  List<User> testlist = [
    User(
        image: Image.asset("assets/testasset.gif"),
        name: "Engin Batın Yılmazzzzzzzzzzzzzzzzzzzzz"),
  ];
  @override
  Widget build(BuildContext context) {
    final brightnessProvider = Provider.of<BrightnessProvider>(context);
    return Scaffold(
      appBar: mainAppBar(
        brightnessProvider,
        "Chats",
        Symbols.add_call,
        Symbols.contacts,
        Symbols.search,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
              child: Divider(
                height: 1,
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                scrollDirection: Axis.horizontal,
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(5, 8, 5, 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          child: testlist[0].image,
                          radius: 28,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Flexible(
                          child: Text(
                            testlist[0].name.length > 11
                                ? '${testlist[0].name.substring(0, 8)}...'
                                : testlist[0].name,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              child: Divider(
                height: 1,
              ),
              padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                child: ListView.builder(
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.fromLTRB(7, 8, 7, 8),
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: testlist[0].image,
                            radius: 28,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                testlist[0].name.length > 25
                                    ? "${testlist[0].name.substring(0, 25)}..."
                                    : testlist[0].name,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                "yok kanka en son bilmem en".length > 11
                                    ? '${"yok kanka en son bilmem en".substring(0, 8)}...'
                                    : "Yok kanka en son bilmem en",
                                style: TextStyle(
                                  color: brightnessProvider.brightness ==
                                          Brightness.dark
                                      ? Colors.grey
                                      : Colors.grey.shade900,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
