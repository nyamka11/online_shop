import "package:flutter/material.dart";
import '../../data/categories_data.dart';
import '../../models/category.dart';
import '../../services/m_cateogory.dart';
import './category_widget.dart';

class CategoriesView extends StatefulWidget {
  CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  List<CategoryModel> categories = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    Future<List<CategoryModel>> categoriesFuture = CategoryService.getAll();
    var categoriesAll = await categoriesFuture;
    if (mounted) {
      setState(() {
        categories = categoriesAll;
      });
    }
  }

  Widget girdViewCustom(BuildContext context, List<CategoryModel> categories) {
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
                  index: index,
                  catId: categories[index].catId,
                  catName: categories[index].catName),
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
                index: index,
                catId: categories[index].catId,
                catName: categories[index].catName,
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
          girdViewCustom(context, categories)
        ],
      ),
    );
  }
}
