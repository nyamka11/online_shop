import 'package:flutter/material.dart';
import 'package:online_shop/pages/homepage.dart';
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
        Routes.homePage: (context) => HomePage(),
        Routes.productDetail: (context) => ProductsDetail(),
        Routes.productList: (context) => ProductList(),
      },
    );
  }
}
