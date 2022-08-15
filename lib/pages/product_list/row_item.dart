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
          Navigator.of(context).pushNamed(Routes.productDetailPage);
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
                  // color: Colors.grey,
                  // width: double.infinity,
                  // height: double.infinity,
                  child: Image.network(
                    products[index].imageUrl,
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
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
                      // height: 40,
                      child: Text(products[index].description),
                    ),
                    Container(
                      // color: Colors.red,
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "¥${products[index].price}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      // color: Colors.green,
                      // padding: EdgeInsets.all(8),
                      child: Row(
                        children: const [
                          SizedBox(width: 10),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 24.0,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 24.0,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 24.0,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          ),
                          Icon(
                            Icons.star_half,
                            color: Colors.amber,
                            size: 24.0,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          ),
                          Icon(
                            Icons.star_border,
                            color: Colors.amber,
                            size: 24.0,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text("923"),
                          ),
                          SizedBox(width: 20),
                          Icon(
                            Icons.comment_outlined,
                            color: Color.fromARGB(255, 42, 42, 41),
                            size: 18.0,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text("230"),
                          ),
                        ],
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
