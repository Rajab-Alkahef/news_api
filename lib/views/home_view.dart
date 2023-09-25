import 'package:flutter/material.dart';

import 'package:news_app_ui_setup/widgets/home_view_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isSearching = false;
    bool isRefreshing = false;

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
                setState(() {
                  isSearching = !isSearching;
                });
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
        body: RefreshIndicator(
          color: Colors.orange,
          onRefresh: () async {
            setState(() {
              isRefreshing = true;
            });
            await Future.delayed(const Duration(seconds: 1));
            setState(() {
              isRefreshing = false;
              isSearching = false;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: HomeViewBuilder(
              isSearching: isSearching,
              isRefreshing: isRefreshing,
            ),
          ),
        ),
      ),
    );
  }
}
