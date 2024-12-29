import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/features/news/data/news_models/article_model.dart';
import 'package:news_app/features/news/scrapers/article_scraper.dart';

class ArticleDataSource {
  final String? _apiKey = dotenv.env['NEWS_API_KEY'];
  final String _baseUrl = 'https://newsapi.org/v2/everything';
  final String _defaultParam = 'rwanda';
  final ArticleScraper _scraper = ArticleScraper();

  Future<http.Response> fetchArticles() async {
    final String buildUrl = '$_baseUrl?q=$_defaultParam&apiKey=$_apiKey';
    return await http.get(Uri.parse(buildUrl));
  }

  Future<ArticleModel> enrichArticleWithContent(ArticleModel article) async  {
    if(article.originalUrl != null && article.originalUrl!.isNotEmpty) {
      String fullContent  = await _scraper.scrapeArticleContent(article.originalUrl!);

      return ArticleModel(
        sourceName: article.sourceName,
        title: article.title,
        description: article.description,
        content: fullContent,
        imageUrl: article.imageUrl,
        publishedDate: article.publishedDate,
        author: article.author,
        originalUrl: article.originalUrl,
      );
    }
    return  article;
  }
}
