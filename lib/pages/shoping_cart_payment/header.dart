import 'package:flutter/material.dart';

import '../../_routers.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: const Text(
            "XXXXXXXXXXXXXXXXXX  さんカートの内容で注文に進みます",
            style: TextStyle(fontSize: 17),
          ),
        ),
        Container(
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(Routes.productListPage);
            },
            child: const Text(
              "商品一覧に戻る",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
