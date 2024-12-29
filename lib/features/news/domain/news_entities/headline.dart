class Headline {
  final String daysAfterPublication; // eg: 13 days ago
  final String sourceName;
  final String title;
  final String imageUrl;
  String? content;
  String? author;
  final String? originalUrl;

  Headline({
    required this.daysAfterPublication,
    required this.title,
    required this.sourceName,
    required this.imageUrl,
    this.content,
    this.author,
    this.originalUrl,
  });
}
