import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ArticleDataSource {
  final String? _apiKey = dotenv.env['NEWS_API_KEY'];
  final String _baseUrl = 'https://newsapi.org/v2/everything';
  final String _defaultParam = 'rwanda';

  Future<http.Response> fetchArticles() async {
    final String buildUrl = '$_baseUrl?q=$_defaultParam&apiKey=$_apiKey';
    return await http.get(Uri.parse(buildUrl));
  }
}
