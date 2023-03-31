import 'package:flutter/material.dart';
import 'package:rcp/screens/loading_screen/loading_screen.dart';
import 'package:rcp/utils/image_network.dart';

import '../../../product_modal/product_modal.dart';
import '../../product_overview/product_overview.dart';

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
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductOverviewScreen(
                          id: listToShow[index].id as int),
                    ));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: GridTile(
                  footer: Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(183, 0, 0, 0)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        listToShow[index].name as String,
                        style:
                            const TextStyle(color: Colors.yellow, fontSize: 11),
                      ),
                    ),
                  ),
                  header: ImgageLoading(
                      imageSrc: listToShow[index].images.first.src as String,
                      boxFit: BoxFit.fill),
                  child: const SizedBox(),
                ),
              ),
            ),
          );
        });
  }
}
