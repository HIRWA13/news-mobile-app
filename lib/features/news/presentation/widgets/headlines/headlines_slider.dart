import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/domain/news_use_cases/article_use_cases.dart';
import 'package:news_app/features/news/presentation/state/headlines_cubit.dart';
import 'package:news_app/features/news/presentation/widgets/headlines/single_headline.dart';
import 'package:news_app/locator.dart';

import '../../../domain/news_entities/headline.dart';

class HeadlinesSlider extends StatelessWidget {
  HeadlinesSlider({super.key});

  final ArticleUseCases articleUseCases = locator<ArticleUseCases>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HeadlinesCubit, List<Headline>>(
      builder: (context, state) {
        if (state.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            child: CarouselSlider.builder(
              itemCount: state.length,
              itemBuilder: (context, index, itemIndex) {
                return SingleHeadline(headline: state[index]);
              },
              options: CarouselOptions(
                height: 340.0,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                viewportFraction: 0.92,
              ),
            ),
          ),
        );
      },
    );
  }
}
