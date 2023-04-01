import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcp/api_data/rcp_data_provider.dart';

import 'package:html/parser.dart';
import 'package:rcp/utils/extension.dart';
import 'package:rcp/utils/image_network.dart';

import '../../product_modal/product_modal.dart';

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
        Provider.of<RcpData>(context, listen: false).getProductByID(widget.id);

    super.initState();
  }

  List<ImageList>? get imagesList {
    List<ImageList>? imagesList = product.images;

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
    double height = AppBar().preferredSize.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${product.name}',
          style: Theme.of(context).textTheme.labelMedium,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.35 - height,
            decoration: const BoxDecoration(),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: CarouselSlider.builder(
              itemCount: imagesList!.length,
              itemBuilder: (context, index, realIndex) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: ImgageLoading(
                            imageSrc: imagesList![index].src as String,
                            boxFit: BoxFit.cover),
                      )),
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
                      style: const TextStyle(color: Colors.blue, fontSize: 15),
                    ),
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
                        child: Text(
                          _parseHtmlString(product.shortDescription as String),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
