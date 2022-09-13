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
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 207, 207, 207),
                    ),
                  ),
                  height: 180,
                  child: Image.network(
                    products[index].imageUrl,
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        products[index].title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Text(products[index].description),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: const Text("1箱16袋入り"),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: const Text("新着/お薦め"),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        children: const [
                          SizedBox(width: 20),
                          CircleAvatar(
                            backgroundColor: Color.fromARGB(221, 34, 34, 34),
                            child: Icon(
                              Icons.recycling,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 20),
                          CircleAvatar(
                            backgroundColor: Color.fromARGB(221, 34, 34, 34),
                            child: Icon(
                              Icons.language_sharp,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 20),
                          CircleAvatar(
                            backgroundColor: Color.fromARGB(221, 34, 34, 34),
                            child: Icon(
                              Icons.compost,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "¥${products[index].total}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
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
