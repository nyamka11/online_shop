import 'package:flutter/material.dart';
import '../widgets/_common/layout_template.dart';
import '../_constants.dart';

class ProductsDetailPage extends StatelessWidget {
  const ProductsDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayoutTemplate(
      bgColor: Colors.black12,
      body: SizedBox(
        height: MediaQuery.of(context).size.height - Common.footerHeigth,
        width: double.infinity,
        child: const Text("aa"),
      ),
    );
  }
}
