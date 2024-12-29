import 'package:get_it/get_it.dart';
import 'package:news_app/features/news/data/news_data_source/article_data_source.dart';
import 'package:news_app/features/news/data/news_repositories/remote/remote_article_repository.dart';

import 'features/news/domain/news_use_cases/article_use_cases.dart';

final GetIt locator = GetIt.instance;

void initLocator() {
  locator.registerFactory<ArticleDataSource>(() => ArticleDataSource());
  locator.registerSingleton<RemoteArticleRepository>(
      RemoteArticleRepository(locator<ArticleDataSource>()));
  locator.registerSingleton<ArticleUseCases>(
      ArticleUseCases(locator<RemoteArticleRepository>()));
}
