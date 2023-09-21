import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/model/news_model.dart';

class SearchPage extends StatefulWidget {
  final List<NewsModel> news;

  const SearchPage({super.key, required this.news});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<NewsModel> _searchedPost = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: TextField(
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
              hintText: 'Search Post',
              hintStyle: TextStyle(color: Colors.white),
              border: InputBorder.none),
          onChanged: (val) {
            setState(() {
              _searchedPost =
                  widget.news.where((el) => el.title.contains(val)).toList();
            });
          },
        ),
      ),
      body: _searchedPost.isEmpty
          ? Center(
              child: Text(
                'No match',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            )
          : ListView.builder(
              itemCount: _searchedPost.length,
              itemBuilder: (ctx, i) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text(_searchedPost[i].title),
                      subtitle: Text(_searchedPost[i].subtitle!),
                    ),
                    const Divider(
                      height: 0,
                    )
                  ],
                );
              },
            ),
    );
  }
}
