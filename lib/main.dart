import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:online_shop/widgets/_common/navigator_key.dart';
import 'pages/member/view_register.dart';
import 'pages/member/view_register_verify.dart';
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
import 'pages/member/view_member_registered.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart' show usePathUrlStrategy;

main() async {
  await dotenv.load(fileName: ".env");

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
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'A-MON Market',
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
        // Routes.verificationNumberConfirmPage: (context) =>
        //     const VerificationNumberConfirmPage(),
        Routes.changePasswordPage: (context) {
          var arguments = ModalRoute.of(context)!.settings.arguments as Map;
          return ChangePasswordPage(email: arguments["email"]);
        },
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
        Routes.tempRegisterPage: (context) => const TempRegisterPage(),
        Routes.tempRegisteredPage: (context) => const TempRegisteredPage(),
        Routes.tempRegisterConfirmPage: (context) =>
            const TempRegisterConfirmPage(),
        // Routes.memberRegisterPage: (context) => const MemberRegister(),
        Routes.memberRegisterVerifyPage: (context) =>
            const MemberRegisterVerify(),
        Routes.memberRegisteredPage: (context) => const MemberRegisteredPage(),
      },
      onGenerateRoute: (settings) {
        var uriData = Uri.parse(settings.name.toString());

        if (Routes.memberRegisterPage == uriData.path) {
          var param1 = uriData.queryParameters["param1"];

          try {
            // param1 = utf8.fuse(base64).decode(param1!);  // tvr zuur
            param1 = param1;
          } catch (e) {
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => HomePage(),
            );
          }

          return MaterialPageRoute(
            settings: settings,
            builder: (context) => MemberRegister(param1: param1.toString()),
          );
        }

        if (Routes.verificationNumberConfirmPage == uriData.path) {
          var param1 = uriData.queryParameters["param1"];
          if (param1 != null) {
            param1 = utf8.fuse(base64).decode(param1);
            return MaterialPageRoute(
              settings: settings,
              builder: (context) =>
                  VerificationNumberConfirmPage(param1: param1.toString()),
            );
          }
        }

        return MaterialPageRoute(
          settings: settings,
          builder: (context) => HomePage(),
        );
      },
    );
  }
}
