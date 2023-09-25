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
    return Stack(
      children: [
        CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
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
                    category: 'Top',
                  ),
          ],
        ),
        isSearching == true
            ? Positioned(
                left: 0,
                right: 0,
                top: 15,
                child: CustomSearchBar(
                  searching: isSearching,
                ))
            : const SizedBox(
                height: 1,
              ),
      ],
    );
  }
}

// class HomeViewBuilder extends StatelessWidget {
//   const HomeViewBuilder({
//     super.key,
//     required this.isSearching,
//     required this.isRefreshing,
//   });
//   final bool isSearching;
//   final bool isRefreshing;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         CustomScrollView(
//           physics: const BouncingScrollPhysics(),
//           slivers: [
//             SliverToBoxAdapter(
//               child: AnimatedPositioned(
//                 duration: const Duration(
//                     milliseconds: 500), // Adjust the duration as needed
//                 top: isSearching ? 150 : 0,
//                 child: Column(
//                   children: [
//                     const CategoriesListView(),
//                     const SizedBox(
//                       height: 32,
//                     ),
//                     isRefreshing == true
//                         ? const ShimmerLoading()
//                         : const NewsListViewBuilder(
//                             category: 'general',
//                           ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//         Positioned(
//           top: 0,
//           left: 0,
//           right: 0,
//           child: isSearching ? const CustomSearchBar() : const SizedBox(),
//         ),
//       ],
//     );
//   }
// }

// class SearchAndAnimationScreen extends StatefulWidget {
//   const SearchAndAnimationScreen({super.key});

//   @override
//   _SearchAndAnimationScreenState createState() =>
//       _SearchAndAnimationScreenState();
// }

// class _SearchAndAnimationScreenState extends State<SearchAndAnimationScreen> {
//   bool isSearching = false;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         CustomScrollView(
//           physics: const BouncingScrollPhysics(),
//           slivers: [
//             SliverToBoxAdapter(
//               child: AnimatedPositioned(
//                 duration: const Duration(
//                     milliseconds: 500), // Adjust the duration as needed
//                 top: isSearching ? 150 : 0, // Move the column up when searching
//                 child: Column(
//                   children: [
//                     const CategoriesListView(),
//                     const SizedBox(height: 32),
//                     isSearching
//                         ? const ShimmerLoading()
//                         : const NewsListViewBuilder(category: 'general'),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//         Positioned(
//           top: 0,
//           left: 0,
//           right: 0,
//           child: isSearching
//               ? const CustomSearchBar()
//               : const SizedBox(), // Show/hide search bar
//         ),
//       ],
//     );
//   }
// }
