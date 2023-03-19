import 'package:flutter/material.dart';

import '../../../product_modal/product_modal.dart';

class GridBuliderView extends StatelessWidget {
  const GridBuliderView({
    Key? key,
    required this.listToShow,
  }) : super(key: key);
  final List<Product> listToShow;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: listToShow.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4 / 3,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: GridTile(
                footer: Container(
                  decoration:
                      const BoxDecoration(color: Color.fromARGB(183, 0, 0, 0)),
                  child: Text(
                    listToShow[index].name as String,
                    style: const TextStyle(color: Colors.yellow),
                  ),
                ),
                header: Image.network(
                  listToShow[index].images.first.src as String,
                  fit: BoxFit.fill,
                ),
                child: const SizedBox(),
              ),
            ),
          );
        });
  }
}
