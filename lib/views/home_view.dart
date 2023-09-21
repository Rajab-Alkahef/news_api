import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/model/news_model.dart';
import 'package:news_app_ui_setup/views/search_page.dart';
import 'package:news_app_ui_setup/widgets/categories_list_view.dart';
import 'package:news_app_ui_setup/widgets/news_list_view_builder.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<NewsModel> news = [
    NewsModel(url: 'fds', image: 'image', title: 'title', subtitle: 'subtitle')
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => SearchPage(
                      news: news,
                    ),
                  ),
                );
              },
            )
          ],
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Padding(
            padding: EdgeInsets.only(left: 42.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "News",
                  style: TextStyle(
                    color: Color(0xff000000),
                  ),
                ),
                Text(
                  "Cloud",
                  style: TextStyle(color: Colors.orange),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: RefreshIndicator(
            onRefresh: () async {
              print('refreshed');
              const NewsListViewBuilder(
                category: 'general',
              );
              setState(() {});
            },
            child: const CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(child: CategoriesListView()),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 32,
                  ),
                ),
                NewsListViewBuilder(
                  category: 'general',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
