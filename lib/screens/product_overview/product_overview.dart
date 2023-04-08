import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcp/providers/cart_provider.dart';
import 'package:rcp/providers/list_method_provider.dart';

import 'package:rcp/screens/product_overview/descryption_widget.dart';
import 'package:rcp/screens/product_overview/question_screen/question_screen.dart';
import 'package:rcp/screens/product_overview/slider_wiget.dart';
import 'package:rcp/utils/extension.dart';

import '../../product_modal/product_modal.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  List<Product> allProductList = [];
  late Product product;
  late Uri _permalink;

  @override
  void initState() {
    product = Provider.of<ListMethod>(context, listen: false)
        .getProductByID(widget.id);
    _permalink = Uri.parse(product.permalink as String);
    super.initState();
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_permalink)) {
      throw Exception('Could not launch $_permalink');
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = AppBar().preferredSize.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.question_mark),
          label: Text('Ask Question'),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => QuestionFormScreen(
                      singleProductDetail: product,
                    )));
          }),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false)
                    .addProductToList(product);
              },
              icon: Icon(Icons.shopping_cart)),
          IconButton(
            onPressed: () {
              Share.share('Racing Custom Parts ${_permalink}');
            },
            icon: const Icon(Icons.share),
          )
        ],
        title: Text(
          '${product.name}',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Container(
        child: Column(
          children: [
            SliderWidget(
                height: height,
                imagesList: product.images,
                name: product.name as String),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.65 - height,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          product.name!.toUpperCase(),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Text(
                        '${double.parse(product.price).toStringAsFixed(2)}€',
                        style: const TextStyle(color: Colors.red, fontSize: 20),
                      ),
                      Text(
                        '${product.price.addVat()}€ inc.VAT',
                        style:
                            const TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                      const Divider(
                        height: 2,
                      ),
                      TextButton(
                          style: const ButtonStyle(
                            elevation: MaterialStatePropertyAll(3),
                          ),
                          onPressed: _launchUrl,
                          child: const Text('Show in Web')),
                      const SizedBox(
                        height: 10,
                      ),
                      DescryptionWidget(
                        shortDescryption: product.shortDescription as String,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
