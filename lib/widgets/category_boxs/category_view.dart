import "package:flutter/material.dart";
import '../../data/categories_data.dart';
import './category_widget.dart';

class CategoriesView extends StatelessWidget {
  CategoriesView({super.key});

  final categoriesData = categories;

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
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 360,
              childAspectRatio: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: categories.length,
            itemBuilder: (BuildContext ctx, index) {
              return CatBoxWidget(
                color: categories[index].color,
                name: categories[index].name,
                imageUrl: categories[index].imageUrl,
              );
            },
          ),
        ],
      ),
    );
  }
}
