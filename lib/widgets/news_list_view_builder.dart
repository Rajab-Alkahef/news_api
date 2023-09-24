import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/model/news_model.dart';
import 'package:news_app_ui_setup/widgets/news_list_view.dart';
import 'package:news_app_ui_setup/widgets/shimmer_loading.dart';

import '../services/news_services.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, this.category, this.searchValue});
  final String? category;
  final String? searchValue;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  dynamic future;
  @override
  void initState() {
    super.initState();
    if (widget.category != null) {
      future = NewsService(Dio()).getnews(categoryName: widget.category);
    } else {
      future = NewsService(Dio()).getnews(searchValue: widget.searchValue);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListview(
            articles: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Text("There is an error, try again later"),
          );
        } else {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: ShimmerLoading(),
          );
        }
      },
    );
  }
}
