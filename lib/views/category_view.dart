import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/widgets/news_list_view_builder.dart';
import 'package:news_app_ui_setup/widgets/search_bar.dart';

class CategortyView extends StatefulWidget {
  const CategortyView({super.key, required this.category});
  final String category;

  @override
  State<CategortyView> createState() => _CategortyViewState();
}

class _CategortyViewState extends State<CategortyView> {
  @override
  Widget build(BuildContext context) {
    bool isSearching = false;
    return StatefulBuilder(
      builder: (context, setState) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.orange,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Padding(
            padding: EdgeInsets.only(right: 48.0),
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
        ),
        body: RefreshIndicator(
          color: Colors.orange,
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1));

            NewsListViewBuilder(
              category: widget.category,
            );
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child:
                CategoryViewBuilder(isSearching: isSearching, category: widget),
          ),
        ),
      ),
    );
  }
}

class CategoryViewBuilder extends StatefulWidget {
  const CategoryViewBuilder({
    super.key,
    required this.category,
    required this.isSearching,
  });

  final CategortyView category;
  final bool isSearching;

  @override
  State<CategoryViewBuilder> createState() => _CategoryViewBuilderState();
}

class _CategoryViewBuilderState extends State<CategoryViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        widget.isSearching == true
            ? const SliverToBoxAdapter(
                child: CustomSearchBar(),
              )
            : const SliverToBoxAdapter(
                child: SizedBox(
                  height: 1,
                ),
              ),
        NewsListViewBuilder(
          category: widget.category.category,
        ),
      ],
    );
  }
}
