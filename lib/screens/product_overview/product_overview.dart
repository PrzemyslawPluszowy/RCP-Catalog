import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcp/api_data/api.dart';
import 'package:rcp/product_modal/image.dart';
import 'package:rcp/product_modal/product.dart';

import 'package:html/parser.dart';

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
  @override
  void initState() {
    product =
        Provider.of<ApiData>(context, listen: false).getProductByID(widget.id);

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  List<ImageList> get imagesList {
    List<ImageList> imagesList = product.images ?? [];

    return imagesList;
  }

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;
    return parsedString;
  }

  @override
  Widget build(BuildContext context) {
    print(product.description);
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 234, 234, 234)),
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CarouselSlider.builder(
                itemCount: imagesList.length,
                itemBuilder: (context, index, realIndex) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: Image.network(
                        imagesList[index].src as String,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 250,
                  aspectRatio: 3.0,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  enlargeFactor: 0.2,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 4),
                      child: Center(
                        child: Text(
                          product.name as String,
                          maxLines: 2,
                          style: const TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '${double.parse(product.price as String).toStringAsFixed(2)}€',
                        style: const TextStyle(color: Colors.red, fontSize: 25),
                      ),
                    ),
                    // '${double.parse(listToShow[index].price as String).toStringAsFixed(2)}€',

                    const Divider(
                      height: 2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(_parseHtmlString(
                              product.shortDescription as String)),
                        ))
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
