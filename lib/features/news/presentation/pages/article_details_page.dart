import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/news_entities/headline.dart';

class ArticleDetailsPage extends StatelessWidget {
  const ArticleDetailsPage({super.key, required this.article});

  final Headline article;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(article.daysAfterPublication);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(article.imageUrl),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  height: MediaQuery.of(context).size.height * 0.49,
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      leading: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/avatar.png'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      '${article.author}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Telegraf',
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.sourceName.toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    article.title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        DateFormat('d MMMM yyyy').format(dateTime),
                        style: const TextStyle(
                          fontFamily: 'Telegraph',
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        DateFormat('HH:mm a').format(dateTime),
                        style: const TextStyle(
                          fontFamily: 'Telegraph',
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey[10],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('${article.content}'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
