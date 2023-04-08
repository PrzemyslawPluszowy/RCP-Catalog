import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcp/utils/extension.dart';

import '../../../providers/cart_provider.dart';

class OrderExpanisionWidget extends StatelessWidget {
  const OrderExpanisionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, child) => ExpansionTile(
        title: Text('Order Detail'),
        children: [
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: value.hiveCart.length,
            itemBuilder: (context, index) => Container(
              width: double.maxFinite,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: Text(
                        '${value.hiveCart.values.toList()[index].itemCount}x',
                        softWrap: true),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                      value.hiveCart.values.toList()[index].product.name
                          as String,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                'Total cost ${value.totalCostCount().toStringAsFixed(2)}, including vat ${value.totalCostCount().toStringAsFixed(2).addVat()}'),
          )
        ],
      ),
    );
  }
}
