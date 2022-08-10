import 'package:flutter/material.dart';
import 'package:online_shop/pages/home_page.dart';
import 'package:online_shop/pages/product_detail.dart';

import '_routers.dart';
import 'pages/product_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: "Open Sans"),
      ),
      // home: HomePage(),
      routes: {
        Routes.homePage: (context) => const HomePage(),
        Routes.productDetail: (context) => const ProductsDetail(),
        Routes.productList: (context) => const ProductList(),
      },
    );
  }
}
