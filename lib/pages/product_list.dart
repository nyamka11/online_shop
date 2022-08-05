import 'package:flutter/material.dart';
import 'package:online_shop/data/productData.dart';
import 'package:online_shop/widgets/layout_template.dart';
import '../_routers.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutTemplate(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 7,
              child: SizedBox(
                height: MediaQuery.of(context).size.height + 200,
                // width: double.infinity,
                // width: MediaQuery.of(context).size.width * 0.50,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return ListRows(
                      index: index,
                      ctx: context,
                    );
                  },
                  itemCount: products.length,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Card(
                color: Colors.red,
                child: Container(
                  color: Colors.green,
                  width: double.infinity,
                  child: Text("asdf"),
                  height: MediaQuery.of(context).size.height + 200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListRows extends StatelessWidget {
  final int index;
  final BuildContext ctx;
  const ListRows({super.key, required this.index, required this.ctx});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(Routes.productDetail);
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.green,
                  // width: double.infinity,
                  // height: double.infinity,
                  child: Image.network(
                    products[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          color: Colors.amber,
                          child: Text(
                            products[index].title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            color: Colors.blue,
                            child: Text(products[index].description)),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            color: Colors.red,
                            child: Text(products[index].price.toString())),
                      ],
                    )
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
