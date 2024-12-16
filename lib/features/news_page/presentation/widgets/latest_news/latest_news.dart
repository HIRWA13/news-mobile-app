import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/news_entities/headline.dart';
import '../../state/headlines_cubit.dart';
import 'latest_news_widget.dart';

class LatestNews extends StatelessWidget {
  const LatestNews({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.45,
      child: Column(
        children: [
          Row(
            children: [
              const Text('Latest News'),
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
            return Expanded(
              child: ListView.builder(
                itemCount: state.length,
                itemBuilder: (context, index) {
                  return LatestNewsWidget(
                    title: state[index].title,
                    sourceName: state[index].sourceName,
                    imageUrl: state[index].imageUrl,
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
