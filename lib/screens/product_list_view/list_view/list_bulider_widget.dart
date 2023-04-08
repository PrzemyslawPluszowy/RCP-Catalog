import 'package:flutter/material.dart';
import 'package:rcp/screens/product_list_view/list_view/product_tile_widget.dart';

import '../../../product_modal/product_modal.dart';

class ListBulider extends StatelessWidget {
  const ListBulider({super.key, required this.listToShow});
  final List<Product> listToShow;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listToShow.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: Column(
            children: [
              ProductTile(
                listToShow: listToShow,
                index: index,
                id: listToShow[index].id,
                product: listToShow[index],
              ),
            ],
          ),
        );
      },
    );
  }
}
