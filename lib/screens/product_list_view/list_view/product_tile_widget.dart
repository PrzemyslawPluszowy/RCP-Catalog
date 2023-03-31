import 'package:flutter/material.dart';
import 'package:rcp/screens/product_overview/product_overview.dart';
import 'package:rcp/utils/extension.dart';
import 'package:rcp/utils/image_network.dart';
import '../../../product_modal/product_modal.dart';

class ProductTile extends StatelessWidget {
  const ProductTile(
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
                  child: Container(
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
                          listToShow[index].name as String,
                          maxLines: 2,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '${double.parse(listToShow[index].price as String).toStringAsFixed(2)} €',
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
