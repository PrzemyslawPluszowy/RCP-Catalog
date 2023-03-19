import 'package:flutter/material.dart';
import 'package:rcp/product_modal/product.dart';
import 'package:rcp/screens/product_overview/product_overview.dart';

class ProductTile extends StatelessWidget {
  const ProductTile(
      {super.key,
      required this.listToShow,
      required this.index,
      required this.id});
  final List<Product> listToShow;
  final int index;
  final int id;

  String imageLinkValidator(int index) {
    if (listToShow[index].images?[0] == null) {
      return 'https://racingcustomparts.com/wp-content/uploads/2020/11/If-you-can%E2%80%99t-find-parts-for-your-racecar-we-can-do-it2.png';
    } else {
      return listToShow[index].images![0].src as String;
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
          print(id);
        },
        child: Container(
            color: Colors.white,
            height: 120,
            width: double.infinity,
            child: Row(
              children: [
                SizedBox(
                  width: 150,
                  height: 120,
                  child: Image.network(
                    imageLinkValidator(index),
                    fit: BoxFit.fill,
                    frameBuilder:
                        (context, child, frame, wasSynchronouslyLoaded) {
                      return child;
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
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
                          child: Text(
                            '${double.parse(listToShow[index].price as String).toStringAsFixed(2)}€',
                            style: const TextStyle(color: Colors.red),
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
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
      // trailing: Text(
      //   '${double.parse(listToShow[index].price as String).toStringAsFixed(2)}€',
      //   style: TextStyle(color: Colors.red),
      // ),
//       onTap: () => {},
//       title: Text(listToShow[index].name as String),
//       leading: Container(
//         width: 100,
//         height: 100,
//         child: Image.network(imageLinkValidator(index), fit: BoxFit.cover,
//             frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
//           return child;
//         }, loadingBuilder: (context, child, loadingProgress) {
//           if (loadingProgress == null) {
//             return child;
//           } else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         }),
//       ),
//     );
//   }
// }
