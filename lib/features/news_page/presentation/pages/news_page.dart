import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news_page/presentation/state/headlines_cubit.dart';
import 'package:news_app/features/news_page/presentation/widgets/app_bar/home_app_bar.dart';
import 'package:news_app/features/news_page/presentation/widgets/headlines/headlines_slider.dart';

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
          child: Column(
            children: [HeadlinesSlider()],
          ),
        ),
      ),
    );
  }
}
