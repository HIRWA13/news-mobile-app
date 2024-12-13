import '../news_entities/article.dart';
import '../news_repositories/article_repository.dart';

class ArticleUseCases {
  final ArticleRepository _articleRepository;

  ArticleUseCases(this._articleRepository);

  Future<List<Article>> getArticles() async {
    return await _articleRepository.getAllArticles();
  }

}