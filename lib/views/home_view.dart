import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/widgets/category_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Row(
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
        body: SizedBox(
          height: 110,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CategortyCard(),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
