import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/presentation/pages/article_details_page.dart';
import 'package:news_app/features/news/scrapers/article_scraper.dart';

import '../../../domain/news_entities/headline.dart';
import '../../state/headlines_cubit.dart';
import 'latest_news_widget.dart';

class LatestNews extends StatelessWidget {
  const LatestNews({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.45,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  child: const Text('Latest News'),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_rounded,
                    size: 15,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            BlocBuilder<HeadlinesCubit, List<Headline>>(
                builder: (context, state) {
              final headlines = state.reversed.toList();
              return Expanded(
                child: ListView.builder(
                  itemCount: headlines.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => _handleArticleScrape(
                        context,
                        headlines[index],
                      ),
                      // onTap: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => ArticleDetailsPage(
                      //         article: headlines[index],
                      //       ),
                      //     ),
                      //   );
                      // },
                      child: LatestNewsWidget(
                        title: headlines[index].title,
                        sourceName: headlines[index].sourceName,
                        imageUrl: headlines[index].imageUrl,
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

Future<void> _handleArticleScrape(
    BuildContext context, Headline headline) async {
  //  show loading dialog
  final ArticleScraper scraper = ArticleScraper();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      );
    },
  );

  try {
    final String scrappedContent =
        await scraper.scrapeArticleContent(headline.originalUrl!);

    if (!context.mounted) return;
    Navigator.pop(context);

    final enrichedHeadline = Headline(
      author: headline.author,
      sourceName: headline.sourceName,
      title: headline.title,
      daysAfterPublication: headline.daysAfterPublication,
      content: scrappedContent,
      imageUrl: headline.imageUrl,
      originalUrl: headline.originalUrl,
    );
    if (!context.mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ArticleDetailsPage(
          article: enrichedHeadline,
        ),
      ),
    );
  } catch (e) {
    Navigator.pop(context);
    debugPrint(e.toString());
  }
}
