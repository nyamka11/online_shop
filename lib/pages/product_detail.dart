import 'package:flutter/material.dart';
import '../widgets/_Common/layout_template.dart';
import '../_constants.dart';

class ProductsDetail extends StatelessWidget {
  const ProductsDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutTemplate(
      bgColor: Colors.black12,
      body: SizedBox(
        height: MediaQuery.of(context).size.height - Common.footerHeigth,
        width: double.infinity,
        child: Text("aa"),
      ),
    );
  }
}
