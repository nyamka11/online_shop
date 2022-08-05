import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LinkBtn extends StatelessWidget {
  const LinkBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                  text: "その他の商品も見てみる",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      var url = "https://flutter-examples.com";
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }),
            ])));
  }

  canLaunch(String url) {}

  launch(String url) {}
}
