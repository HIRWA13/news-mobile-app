class Headline {
  final String daysAfterPublication; // eg: 13 days ago
  final String sourceName;
  final String title;
  final String imageUrl;

  Headline({
    required this.daysAfterPublication,
    required this.title,
    required this.sourceName,
    required this.imageUrl,
  });
}