import 'package:flutter/material.dart';
import 'package:online_shop/pages/home_page.dart';
import 'package:online_shop/pages/login/view.dart';
import 'package:online_shop/pages/product_detail/view.dart';
import 'package:online_shop/provider/shoping_cart_provider.dart';
import 'package:provider/provider.dart';
import '_routers.dart';
import 'pages/product_list/view.dart';
import 'pages/shoping_cart/view.dart';
import 'pages/shoping_cart_verify/view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/shopnig_cart_finished/view.dart';
import 'pages/shopnig_cart_payment/view.dart';
import 'pages/shopnig_cart_payment_failed/view.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.notoSansJavaneseTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      // home: HomePage(),
      initialRoute: Routes.homePage,
      routes: {
        Routes.homePage: (context) => const HomePage(),
        Routes.loginPage: (context) => const LoginPage(),
        Routes.productDetailPage: (context) => const ProductsDetailPage(),
        Routes.productListPage: (context) => const ProductListPage(),
        Routes.shopingCartPage: (context) => const ShopingCartPage(),
        Routes.shopingCartVerify: (context) => const ShopingCartVerify(),
        Routes.shopingCartPayment: (context) => const ShopingCartPayment(),
        Routes.shopingCartFinished: (context) => const ShopingCartFinished(),
        Routes.shopingCartFailed: (context) => const ShopingCartFailed(),
      },
    );
  }
}
