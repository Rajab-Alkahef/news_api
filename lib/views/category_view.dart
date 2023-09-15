import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/widgets/news_list_view_builder.dart';

class CategortyView extends StatelessWidget {
  const CategortyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          NewsListViewBuilder(),
        ],
      ),
    );
  }
}
