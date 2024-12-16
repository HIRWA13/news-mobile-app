import 'package:flutter/material.dart';

class LatestNewsWidget extends StatelessWidget {
  const LatestNewsWidget({
    super.key,
    required this.title,
    required this.sourceName,
    required this.imageUrl,
  });

  final String sourceName;
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(imageUrl),
        Column(
          children: [
            Text(
              sourceName.toUpperCase(),
              style: const TextStyle(color: Colors.grey),
            ),
            Text(title)
          ],
        )
      ],
    );
  }
}
