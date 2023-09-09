import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/model/category_model.dart';

class CategortyCard extends StatelessWidget {
  const CategortyCard({super.key, required this.category});
  final CategortyModel category;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 165,
      decoration: BoxDecoration(
        image: DecorationImage(
          opacity: 0.7,
          image: AssetImage(category.image),
          fit: BoxFit.fill,
        ),
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          category.categoryName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
