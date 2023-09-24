import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/widgets/news_list_view_builder.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({super.key, this.searchValue});
  final String? searchValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: const Text("Search Result"),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16),
        child: CustomScrollView(slivers: [
          NewsListViewBuilder(
            searchValue: searchValue,
          ),
        ]),
      ),
    );
  }
}
