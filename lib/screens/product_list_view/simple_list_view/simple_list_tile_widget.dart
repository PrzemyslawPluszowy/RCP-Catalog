import 'package:flutter/material.dart';
import 'package:rcp/screens/product_overview/product_overview.dart';
import 'package:rcp/utils/image_network.dart';

import '../../../product_modal/product_modal.dart';

class ProductSimpleTile extends StatelessWidget {
  const ProductSimpleTile(
      {super.key,
      required this.listToShow,
      required this.index,
      required this.id});
  final List<Product> listToShow;
  final int index;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
          autofocus: true,
          focusColor: Colors.red,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductOverviewScreen(id: id),
                ));
          },
          child: ListTile(
              title: Text(listToShow[index].name as String),
              leading: SizedBox(
                height: 50,
                width: 80,
                child: ImgageLoading(
                    boxFit: BoxFit.fill,
                    imageSrc: listToShow[index].images.first.src as String),
              ))),
    );
  }
}
