import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/locator.dart';

import '../../domain/news_entities/headline.dart';
import '../../domain/news_use_cases/article_use_cases.dart';

class HeadlinesCubit extends Cubit<List<Headline>> {
  HeadlinesCubit() : super([]);

  final ArticleUseCases articleUseCases = locator<ArticleUseCases>();

  void loadHeadlines() async {
    List<Headline> headlines = [];
    try {
      final articles = await articleUseCases.getArticles();
      for (int i = 0; i < articles.length; i++) {
        Headline headline = Headline(
          sourceName: articles[i].sourceName!,
          title: articles[i].title!,
          imageUrl: articles[i].imageUrl!,
          daysAfterPublication: articles[i].publishedDate!,
          content: articles[i].content,
          author: articles[i].author,
          originalUrl: articles[i].originalUrl
        );
        headlines.add(headline);
      }
      emit(headlines);
    } on Exception catch (e) {
      debugPrint('Something went wrong with error $e');
    }
  }
}
