import 'dart:convert';

import 'package:news_app/features/news/domain/news_entities/article.dart';
import 'package:news_app/features/news/domain/news_repositories/article_repository.dart';

import '../../news_data_source/article_data_source.dart';
import '../../news_models/article_model.dart';

class RemoteArticleRepository implements ArticleRepository {
  final ArticleDataSource _articleDataSource;

  RemoteArticleRepository(this._articleDataSource);

  @override
  Future<List<Article>> getAllArticles() async {
    final response = await _articleDataSource.fetchArticles();

    if (response.statusCode == 200) {
      final List<dynamic> articles = jsonDecode(response.body)['articles'];

      final articlesData =
          articles.map((article) => ArticleModel.fromJson(article)).toList();
      return articlesData;
    } else {
      throw Exception('Loading articles failed with ${response.statusCode}');
    }
  }
}
