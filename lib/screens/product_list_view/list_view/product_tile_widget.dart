import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcp/providers/cart_provider.dart';
import 'package:rcp/screens/product_overview/product_overview.dart';
import 'package:rcp/utils/extension.dart';
import 'package:rcp/utils/image_network.dart';
import '../../../product_modal/product_modal.dart';

class ProductTile extends StatelessWidget {
  const ProductTile(
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
    const snackBar = SnackBar(
      duration: Duration(seconds: 1),
      content: Text('You add product to Cart'),
    );
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
        child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30)),
              color: Theme.of(context).colorScheme.surfaceVariant,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            height: 120,
            width: double.infinity,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30)),
                  child: SizedBox(
                    width: 150,
                    height: 120,
                    child: ImgageLoading(
                      imageSrc: listToShow[index].images.first.src as String,
                      boxFit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          listToShow[index].name,
                          maxLines: 2,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${double.parse(listToShow[index].price).toStringAsFixed(2)} €',
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '${listToShow[index].price.addVat()}€ inc.Vat',
                                    style: const TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {
                                    Provider.of<CartProvider>(context,
                                            listen: false)
                                        .addProductToList(product)
                                        .then((value) =>
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar));
                                  },
                                  icon: const Icon(Icons.shop)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
