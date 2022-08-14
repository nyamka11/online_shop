import 'package:flutter/material.dart';
import '../../data/recomment_data.dart';
import './box_widget.dart';

class BoxView extends StatelessWidget {
  const BoxView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text("今月のお勧め商品", style: TextStyle(fontSize: 20)),
          screenWidth > 1000 ? bigScreen(context) : smallScreen(context),
        ],
      ),
    );
  }

  Widget bigScreen(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 4,
      children: List.generate(
        recommentProducts.length,
        (index) => BoxWidget(
          productItem: recommentProducts[index],
        ),
      ),
    );
  }

  Widget smallScreen(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 350,
        childAspectRatio: 0.9,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: recommentProducts.length,
      itemBuilder: (BuildContext ctx, index) {
        return BoxWidget(
          productItem: recommentProducts[index],
        );
      },
    );
  }
}
