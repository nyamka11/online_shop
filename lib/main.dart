import 'package:flutter/material.dart';
import '_routers.dart';
import 'pages/home_page.dart';
import 'pages/invitation/view%20invitation_result.dart';
import 'pages/invitation/view.dart';
import 'pages/login/view.dart';
import 'pages/login/view_change_password.dart';
import 'pages/login/view_forget_password.dart';
import 'pages/login/view_password_changed.dart';
import 'pages/login/view_verification_number_confirm.dart';
import 'pages/product_detail/view.dart';
import 'provider/shoping_cart_provider.dart';
import 'package:provider/provider.dart';
import 'pages/commercial_transaction/view.dart';
import 'pages/member/view.dart';
import 'pages/privacy_policy/view.dart';
import 'pages/product_list/view.dart';
import 'pages/shoping_cart/view.dart';
import 'pages/shoping_cart_verify/view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/shopnig_cart_finished/view.dart';
import 'pages/shopnig_cart_payment/view.dart';
import 'pages/shopnig_cart_payment_failed/view.dart';
import 'pages/member/view_temp_registered.dart';
import 'pages/member/view_temp_register_confirm.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart' show usePathUrlStrategy;

void main() {
  usePathUrlStrategy();
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
      initialRoute: Routes.homePage,
      routes: {
        Routes.homePage: (context) => HomePage(),
        Routes.loginPage: (context) => const LoginPage(),
        Routes.forgetPasswordPage: (context) => const ForgetPasswordPage(),
        Routes.verificationNumberConfirmPage: (context) =>
            const VerificationNumberConfirmPage(),
        Routes.changePasswordPage: (context) => const ChangePasswordPage(),
        Routes.passwordChanged: (context) => const PasswordChangedInfoPage(),
        Routes.productDetailPage: (context) => const ProductsDetailPage(),
        Routes.productListPage: (context) => const ProductListPage(),
        Routes.shopingCartPage: (context) => const ShopingCartPage(),
        Routes.shopingCartVerify: (context) => const ShopingCartVerify(),
        Routes.shopingCartPayment: (context) => const ShopingCartPayment(),
        Routes.shopingCartFinished: (context) => const ShopingCartFinished(),
        Routes.shopingCartFailed: (context) => const ShopingCartFailed(),
        Routes.invitationPage: (context) => const InvitationPage(),
        Routes.invitationResultPage: (context) => const InvitationResultPage(),
        Routes.privacyPolicyPdf: (context) => PrivacyPolicyPdf(),
        Routes.commercialTransactionPdf: (context) =>
            const CommercialTransactionPdf(),
        Routes.memberRegisterPage: (context) => const MemberRegisterPage(),
        Routes.memberRegisteredPage: (context) => const TempRegisteredPage(),
        Routes.memberRegisterConfirmPage: (context) =>
            const TempRegisterConfirmPage(),
      },
    );
  }
}
