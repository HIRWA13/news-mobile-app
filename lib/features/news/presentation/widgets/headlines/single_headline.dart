import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:unicons/unicons.dart';
import '../../../domain/news_entities/headline.dart';

class SingleHeadline extends StatelessWidget {
  const SingleHeadline({
    super.key,
    required this.headline,
  });

  final Headline headline;

  @override
  Widget build(BuildContext context) {
    final relativeTime = timeago.format(
      DateTime.parse(headline.daysAfterPublication),
    );
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(headline.imageUrl),
          fit: BoxFit.fill,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 7),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        headline.sourceName.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Telegraf',
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      relativeTime,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      headline.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        Icon(
                          UniconsLine.comment_dots,
                          color: Colors.white,
                          size: 25,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Icon(
                          UniconsLine.bookmark,
                          color: Colors.white,
                          size: 25,
                        ),
                        Expanded(child: SizedBox()),
                        Icon(
                          UniconsLine.share,
                          color: Colors.white,
                          size: 25,
                          weight: 0.5,
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
