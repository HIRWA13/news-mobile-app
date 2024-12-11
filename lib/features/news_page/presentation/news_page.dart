import 'package:flutter/material.dart';
import 'package:news_app/features/news_page/presentation/widgets/app_bar/home_app_bar.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: const Column(
            children: [
              Text(''),
            ],
          ),
        ),
      ),
    );
  }
}
