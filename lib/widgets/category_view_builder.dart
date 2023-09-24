import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/views/category_view.dart';
import 'package:news_app_ui_setup/widgets/news_list_view_builder.dart';
import 'package:news_app_ui_setup/widgets/search_bar.dart';
import 'package:news_app_ui_setup/widgets/shimmer_loading.dart';

class CategoryViewBuilder extends StatelessWidget {
  const CategoryViewBuilder({
    super.key,
    required this.category,
    required this.isSearching,
    required this.isRefreshing,
  });

  final CategortyView category;
  final bool isSearching;
  final bool isRefreshing;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        isSearching == true
            ? const SliverToBoxAdapter(
                child: CustomSearchBar(),
              )
            : const SliverToBoxAdapter(
                child: SizedBox(
                  height: 1,
                ),
              ),
        isRefreshing == true
            ? const SliverFillRemaining(
                hasScrollBody: false, child: ShimmerLoading())
            : NewsListViewBuilder(
                category: category.category,
              ),
      ],
    );
  }
}
