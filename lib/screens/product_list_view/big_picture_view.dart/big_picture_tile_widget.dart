import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:rcp/screens/product_overview/product_overview.dart';
import 'package:rcp/utils/image_network.dart';

import '../../../product_modal/product_modal.dart';

class BigPictureTile extends StatelessWidget {
  const BigPictureTile(
      {super.key,
      required this.listToShow,
      required this.index,
      required this.id});
  final List<Product> listToShow;
  final int index;
  final int id;

  String textDescryption(String shortDesc, int range) {
    final document = parse(shortDesc);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;

    if (parsedString.length > range) {
      String text =
          parsedString.replaceRange(range, parsedString.length, '...');

      return text;
    } else {
      return parsedString;
    }
  }

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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(16)),
                    width: double.infinity,
                    height: 200,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: ImgageLoading(
                          boxFit: BoxFit.fill,
                          imageSrc:
                              listToShow[index].images.first.src as String,
                        )),
                  ),
                  Text(
                    listToShow[index].name as String,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            textDescryption(
                                listToShow[index].shortDescription as String,
                                100),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                                '${double.parse(listToShow[index].price as String).toStringAsFixed(2)}€',
                                style: Theme.of(context).textTheme.labelLarge),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
