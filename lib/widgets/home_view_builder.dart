import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/widgets/categories_list_view.dart';
import 'package:news_app_ui_setup/widgets/news_list_view_builder.dart';
import 'package:news_app_ui_setup/widgets/search_bar.dart';
import 'package:news_app_ui_setup/widgets/shimmer_loading.dart';

class HomeViewBuilder extends StatelessWidget {
  const HomeViewBuilder({
    super.key,
    required this.isSearching,
    required this.isRefreshing,
  });
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
              )),
        const SliverToBoxAdapter(child: CategoriesListView()),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 32,
          ),
        ),
        isRefreshing == true
            ? const SliverFillRemaining(
                hasScrollBody: false, child: ShimmerLoading())
            : const NewsListViewBuilder(
                category: 'general',
              ),
      ],
    );
  }
}
