import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcp/screens/product_overview/product_overview.dart';
import 'package:rcp/utils/image_network.dart';

import '../../../product_modal/product_modal.dart';
import '../../../providers/cart_provider.dart';

class ProductSimpleTile extends StatelessWidget {
  const ProductSimpleTile(
      {super.key,
      required this.listToShow,
      required this.index,
      required this.id,
      required this.product});
  final List<Product> listToShow;
  final int index;
  final int id;
  final Product product;

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
              trailing: IconButton(
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .addProductToList(product);
                  },
                  icon: const Icon(Icons.shop)),
              title: Text(listToShow[index].name,
                  style: Theme.of(context).textTheme.bodySmall),
              leading: SizedBox(
                height: 100,
                width: 100,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15)),
                  child: ImgageLoading(
                      boxFit: BoxFit.fill,
                      imageSrc: listToShow[index].images.first.src as String),
                ),
              ))),
    );
  }
}
