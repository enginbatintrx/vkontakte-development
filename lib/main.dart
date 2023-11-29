import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vkontakte/views/navbar_screen.dart';
import 'package:vkontakte/views/screens/home/profile.dart';

import 'core/providers/theme_provider.dart';
import 'views/screens/search_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => BrightnessProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightnessProvider = Provider.of<BrightnessProvider>(context);
    return MaterialApp(
      title: "VK",
      theme: brightnessProvider.brightness == Brightness.light
          ? ThemeData.light(useMaterial3: true)
          : ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        '/': (context) => NavBarScreen(),
        '/searchPage': (context) => MySearchPage(),
        '/profilePage': (context) => Profile(),
      },
    );
  }
}
