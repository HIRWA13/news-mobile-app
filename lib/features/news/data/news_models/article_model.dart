import '../../domain/news_entities/article.dart';

class ArticleModel extends Article {
  final String? sourceName;
  final String? title;
  final String? description;
  final String? content;
  final String? imageUrl;
  final String? publishedDate;
  final String? author;
  final String? originalUrl;

  ArticleModel({
    this.sourceName,
    this.title,
    this.description,
    this.content,
    this.imageUrl,
    this.publishedDate,
    this.author,
    this.originalUrl,
  }) : super(
          sourceName: sourceName,
          title: title,
          description: description,
          content: content,
          imageUrl: imageUrl,
          publishedDate: publishedDate,
          originalUrl: originalUrl,
        );

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      sourceName: json['source']?['name'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      content: json['content'] ?? '',
      imageUrl: json['urlToImage'] ??
          'https://previews.123rf.com/images/portokalis/portokalis1607/portokalis160700034/60947667-daily-news-newspaper-headline.jpg',
      publishedDate: json['publishedAt'] ?? '',
      author: json['author'] ?? json['source']?['name'],
      originalUrl: json['url'] ?? '',
    );
  }
}
