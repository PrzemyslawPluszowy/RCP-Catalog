import 'package:flutter/material.dart';
import 'package:rcp/screens/product_list_view/big_picture_view.dart/big_picture_tile_widget.dart';

import '../../../product_modal/product_modal.dart';

class BigPictureBulider extends StatelessWidget {
  const BigPictureBulider({super.key, required this.listToShow});
  final List<Product> listToShow;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listToShow.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            BigPictureTile(
                listToShow: listToShow, index: index, id: listToShow[index].id),
          ],
        );
      },
    );
  }
}
