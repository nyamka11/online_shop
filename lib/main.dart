import 'package:flutter/material.dart';
import 'package:online_shop/pages/home_page.dart';
import 'package:online_shop/pages/product_detail/view.dart';
import 'package:online_shop/provider/shoping_cart_provider.dart';
import 'package:provider/provider.dart';

import '_routers.dart';
import 'pages/product_list/view.dart';
import 'pages/shoping_cart/view.dart';
import 'pages/shoping_cart_payment/view.dart';
// import 'pages/shoping_cart1.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ShopingCartProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
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
      initialRoute: Routes.homePage,
      routes: {
        Routes.homePage: (context) => const HomePage(),
        Routes.productDetailPage: (context) => ProductsDetailPage(),
        Routes.productListPage: (context) => ProductListPage(),
        Routes.shopingCartPage: (context) => ShopingCartPage(),
        Routes.shopingCartPayment: (context) => ShopingCartPayment()
      },
    );
  }
}
