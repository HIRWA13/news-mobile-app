import '../news_entities/article.dart';

abstract class ArticleRepository {
  Future<List<Article>> getAllArticles();
}