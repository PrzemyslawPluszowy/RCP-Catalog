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
              leading: Container(
                height: 50,
                width: 80,
                child: ImgageLoading(
                    imageSrc: listToShow[index].images.first.src as String),
              ))),
    );
  }
}





// Container(
//             color: Colors.white,
//             height: 120,
//             width: double.infinity,
//             child: Row(
//               children: [
//                 SizedBox(
//                     width: 150,
//                     height: 120,
//                     child: ImgageLoading(
//                         imageSrc:
//                             listToShow[index].images.first.src as String)),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           listToShow[index].name as String,
//                           maxLines: 2,
//                         ),
//                         Align(
//                           alignment: Alignment.bottomRight,
//                           child: Text(
//                             '${double.parse(listToShow[index].price as String).toStringAsFixed(2)}€',
//                             style: const TextStyle(color: Colors.red),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             )),
