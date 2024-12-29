import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/presentation/state/headlines_cubit.dart';
import 'package:news_app/features/news/presentation/widgets/app_bar/home_app_bar.dart';
import 'package:news_app/features/news/presentation/widgets/bottom_navigation/home_bottom_nav.dart';
import 'package:news_app/features/news/presentation/widgets/headlines/headlines_slider.dart';
import 'package:news_app/features/news/presentation/widgets/latest_news/latest_news.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<HeadlinesCubit>(
            create: (BuildContext context) => HeadlinesCubit()..loadHeadlines(),
          )
        ],
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  HeadlinesSlider(),
                  const LatestNews(),
                ],
              ),
              const Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: HomeBottomNav(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
