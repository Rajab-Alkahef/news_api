import 'package:flutter/material.dart';

import 'package:news_app_ui_setup/widgets/categories_list_view.dart';
import 'package:news_app_ui_setup/widgets/news_list_view_builder.dart';
import 'package:news_app_ui_setup/widgets/search_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isSearching = false;

    return StatefulBuilder(
      builder: (context, setState) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              onPressed: () {
                isSearching = !isSearching;
                print("isSearching = $isSearching");
                setState(() {});
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
          child: HomeViewBuilder(isSearching: isSearching),
        ),
      ),
    );
  }
}

class HomeViewBuilder extends StatefulWidget {
  const HomeViewBuilder({
    super.key,
    required this.isSearching,
  });
  final bool isSearching;

  @override
  State<HomeViewBuilder> createState() => _HomeViewBuilderState();
}

class _HomeViewBuilderState extends State<HomeViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.orange,
      onRefresh: () async {
        Future.delayed(const Duration(seconds: 3));
        print('refreshed');
        const NewsListViewBuilder(
          category: 'general',
        );
        setState(() {});
      },
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          widget.isSearching == true
              ? const SliverToBoxAdapter(
                  child: CustomSearchBar(),
                )
              : const SliverToBoxAdapter(child: CategoriesListView()),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 32,
            ),
          ),
          const NewsListViewBuilder(
            category: 'general',
          ),
        ],
      ),
    );
  }
}
