import 'package:flutter/material.dart';
import '../../_routers.dart';
import '../../data/product_data.dart';

class ListRows extends StatelessWidget {
  final int index;
  final BuildContext ctx;

  const ListRows({
    super.key,
    required this.index,
    required this.ctx,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(Routes.productDetailPage, arguments: products[index]);
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 207, 207, 207),
                    ),
                  ),
                  height: 120,
                  child: Image.network(
                    products[index].imageUrl,
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        products[index].title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Text(products[index].description),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "¥${products[index].total}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
