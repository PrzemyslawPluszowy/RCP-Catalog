import 'package:flutter/material.dart';
import 'package:rcp/screens/product_list_view/simple_list_view/simple_list_tile_widget.dart';

import '../../../product_modal/product_modal.dart';

class SimpleListView extends StatelessWidget {
  const SimpleListView({super.key, required this.listToShow});
  final List<Product> listToShow;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        itemCount: listToShow.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Column(
              children: [
                ProductSimpleTile(
                  listToShow: listToShow,
                  index: index,
                  id: listToShow[index].id,
                  product: listToShow[index],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
