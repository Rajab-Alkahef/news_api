import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/widgets/category_view_builder.dart';

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
    bool isRefreshing = false;
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
          // centerTitle: true,
          title: Text(
            widget.category,
            style: const TextStyle(
              color: Color(0xff000000),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              onPressed: () {
                isSearching = true;

                setState(() {});
              },
            )
          ],
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
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CategoryViewBuilder(
              isSearching: isSearching,
              category: widget,
              isRefreshing: isRefreshing,
            ),
          ),
        ),
      ),
    );
  }
}
