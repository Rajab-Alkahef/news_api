import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/model/category_model.dart';
import 'package:news_app_ui_setup/widgets/category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });
  final List<CategortyModel> category = const [
    CategortyModel(
      image: 'assets/business.jpg',
      categoryName: 'Business',
    ),
    CategortyModel(
      image: 'assets/entertainment11.jpg',
      categoryName: 'Entertainment',
    ),
    CategortyModel(
      image: 'assets/general.jpg',
      categoryName: 'Top',
    ),
    CategortyModel(
      image: '؛assets/health.jpg',
      categoryName: 'Health',
    ),
    CategortyModel(
      image: 'assets/science1.jpg',
      categoryName: 'Science',
    ),
    CategortyModel(
      image: 'assets/sport.jpg',
      categoryName: 'Sports',
    ),
    CategortyModel(
      image: 'assets/technology.jpg',
      categoryName: 'Technology',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: category.length,
          itemBuilder: (context, index) {
            return CategortyCard(
              category: category[index],
            );
          }),
    );
  }
}
