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
      image: 'assets/entertaiment.jpg',
      categoryName: 'entertaiment',
    ),
    CategortyModel(
      image: 'assets/general.jpg',
      categoryName: 'general',
    ),
    CategortyModel(
      image: 'assets/health.jpg',
      categoryName: 'health',
    ),
    CategortyModel(
      image: 'assets/science.jpg',
      categoryName: 'science',
    ),
    CategortyModel(
      image: 'assets/sport.jpg',
      categoryName: 'sport',
    ),
    CategortyModel(
      image: 'assets/technology.jpg',
      categoryName: 'technology',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: category.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CategortyCard(
                  category: category[index],
                ),
              );
            }),
      ),
    );
  }
}
