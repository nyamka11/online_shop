import 'package:flutter/material.dart';
import 'package:online_shop/data/product_data.dart';
import '../widgets/_common/layout_template.dart';
import '../_routers.dart';

class ProductList extends StatefulWidget {
  ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  String dropdownValue = 'One';

  final List<String> list = ['One', 'Two', 'Free', 'Four'];

  @override
  Widget build(BuildContext context) {
    return MainLayoutTemplate(
      body: LayoutBuilder(builder: (context, constraints) {
        print(constraints.maxHeight);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text("以下の高品は、正会員の登録をすると購入できます。"),
            ),
            Container(
              margin: EdgeInsets.all(6),
              padding: EdgeInsets.all(6),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    const Text("カテゴリ"),
                    const SizedBox(width: 20),
                    const Text("条件 : "),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.only(left: 8, right: 8),
                      // margin: EdgeInsets.all(8),
                      // color: Colors.white,
                      width: 200,
                      height: 35,
                      child: DropdownButton(
                        underline: SizedBox(),
                        value: dropdownValue,
                        items: list
                            .map(
                              (value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ),
                            )
                            .toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        isExpanded: true,
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Text("バッチ : "),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.only(left: 8, right: 8),
                      // margin: EdgeInsets.all(8),
                      // color: Colors.white,
                      width: 200,
                      height: 35,
                      child: DropdownButton(
                        underline: SizedBox(),
                        value: dropdownValue,
                        items: list
                            .map(
                              (value) => DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              ),
                            )
                            .toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        isExpanded: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ListRows(
                        index: index,
                        ctx: context,
                      );
                    },
                    itemCount: products.length,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.grey,
                    child: Column(
                      children: [
                        Flexible(
                          flex: 3,
                          child: Container(color: Colors.amber),
                        ),
                        Flexible(
                          flex: 5,
                          child: Container(color: Colors.green),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      }),
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
      elevation: 3,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(Routes.productDetail);
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
