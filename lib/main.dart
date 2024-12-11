import 'package:flutter/material.dart';

import 'features/news_page/presentation/news_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter News',
      debugShowCheckedModeBanner: false,
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
