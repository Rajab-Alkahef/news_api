import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/model/news_model.dart';

import 'package:news_app_ui_setup/widgets/news_tile.dart';

class NewsListview extends StatelessWidget {
  const NewsListview({
    super.key,
    required this.articles,
  });

  final List<NewsModel> articles;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 22.0),
            child: NewsTile(news: articles[index]),
          );
        },
      ),
    );
  }
}
// const CategoriesListView()