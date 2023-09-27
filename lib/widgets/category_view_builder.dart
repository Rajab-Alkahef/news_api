import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/views/category_view.dart';
import 'package:news_app_ui_setup/widgets/news_list_view_builder.dart';
import 'package:news_app_ui_setup/widgets/animated_search_bar.dart';
import 'package:news_app_ui_setup/widgets/shimmer_loading.dart';

// ignore: must_be_immutable
class CategoryViewBuilder extends StatefulWidget {
  CategoryViewBuilder({
    super.key,
    required this.category,
    required this.isSearching,
    required this.isRefreshing,
  });

  final CategortyView category;
  bool isSearching;
  final bool isRefreshing;

  @override
  State<CategoryViewBuilder> createState() => _CategoryViewBuilderState();
}

class _CategoryViewBuilderState extends State<CategoryViewBuilder> {
  bool isDrag = false;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
        onVerticalDragDown: (details) {
          // isDrag = false;
          // print(isDrag);
          widget.isSearching = isDrag;
          print(widget.isSearching);
          setState(() {});
        },
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            widget.isRefreshing == true
                ? const SliverFillRemaining(
                    hasScrollBody: false, child: ShimmerLoading())
                : NewsListViewBuilder(
                    category: widget.category.category,
                  ),
          ],
        ),
      ),
      widget.isSearching == true
          ? Positioned(
              left: 0,
              right: 0,
              top: 15,
              child: AnimatedSearchBar(searching: widget.isSearching))
          : const SizedBox(
              height: 1,
            ),
    ]);
  }
}
