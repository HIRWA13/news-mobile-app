import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
// import 'package:html/dom.dart' as dom;

class ArticleScraper {
  Future<String> scrapeArticleContent(String url) async {
    try {
      final headers = {
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
        'Accept':
            'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
      };

      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        var document = parser.parse(response.body);

        final List<String> contentSelectors = [
          'article',
          'content',
          '.article-content',
          '.article-body',
          '.story-content',
          '.content-body',
          'main',
        ];

        String content = '';

        for (var selector in contentSelectors) {
          var elements = document.querySelectorAll(selector);
          if (elements.isNotEmpty) {
            var paragraphs = elements.first.querySelectorAll('p');
            content = paragraphs
                .map((e) => e.text.trim())
                .where((text) => text.isNotEmpty)
                .join('\n\n');

            if (content.isNotEmpty) break;
          }
        }

        if (content.isEmpty) {
          content = document
              .querySelectorAll('p')
              .map((e) => e.text.trim())
              .where((text) => text.isNotEmpty)
              .join('\n\n');
        }

        return content.isEmpty ? 'Could not extract article content' : content;
      } else {
        return 'Failed to load article: ${response.statusCode}';
      }
    } catch (e) {
      return 'Error scraping article: $e';
    }
  }
}
