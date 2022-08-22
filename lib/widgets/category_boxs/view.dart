import "package:flutter/material.dart";
import '../../data/categories_data.dart';
import './category_widget.dart';

class CategoriesView extends StatelessWidget {
  CategoriesView({super.key});

  final categoriesData = categories;

  Widget girdViewCustom(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 1000
        ? GridView.count(
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            children: List.generate(
              categories.length,
              (index) => CatBoxWidget(
                color: categories[index].color,
                name: categories[index].name,
                imageUrl: categories[index].imageUrl,
              ),
            ),
          )
        : GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 350,
              childAspectRatio: 0.9,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: categories.length,
            itemBuilder: (BuildContext ctx, index) {
              return CatBoxWidget(
                color: categories[index].color,
                name: categories[index].name,
                imageUrl: categories[index].imageUrl,
              );
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        children: [
          const Text(
            "カテゴリー",
            style: TextStyle(fontSize: 20),
          ),
          girdViewCustom(context)
        ],
      ),
    );
  }
}