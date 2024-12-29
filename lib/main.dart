import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'features/news/presentation/pages/news_page.dart';
import 'locator.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  initLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter News',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Telegraf',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Container(
        color: Colors.white,
        child: const Padding(
          padding: EdgeInsets.all(20),
          child: NewsPage(),
        ),
      ),
    );
  }
}
