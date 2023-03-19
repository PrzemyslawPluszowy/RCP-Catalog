import 'package:flutter/material.dart';

import 'package:rcp/screens/product_list_view/list_view/product_tile_widget.dart';

import '../../../product_modal/product_modal.dart';

class GridBuliderView extends StatelessWidget {
  const GridBuliderView({
    Key? key,
    required this.listToShow,
  }) : super(key: key);
  final List<Product> listToShow;

  // List<ImageList> get imageList {
  //   List<ImageList> images = [];
  //   listToShow.map((e) => e.images);
  //   return images;
  // }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: listToShow.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                      BoxDecoration(color: Color.fromARGB(183, 0, 0, 0)),
                  child: Text(
                    listToShow[index].name as String,
                    style: TextStyle(color: Colors.yellow),
                  ),
                ),
                header: Image.network(
                  listToShow[index].images![0].src as String,
                  fit: BoxFit.fill,
                ),
                child: Container(child: SizedBox()),
              ),
            ),
          );
        });
  }
}
