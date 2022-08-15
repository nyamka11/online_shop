import 'package:flutter/cupertino.dart';
import 'package:online_shop/widgets/right_window/cart_box.dart';
import 'package:online_shop/widgets/right_window/top_box.dart';

class RightWindow extends StatelessWidget {
  const RightWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        topBox(),
        CartBox(),
      ],
    );
  }
}
