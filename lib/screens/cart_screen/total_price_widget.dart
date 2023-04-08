import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcp/screens/cart_screen/order_screen/order_screen.dart';
import 'package:rcp/utils/extension.dart';

import '../../providers/cart_provider.dart';

class TotalPriceWidget extends StatelessWidget {
  const TotalPriceWidget({
    super.key,
    required this.widthScreen,
    required this.heightScreen,
  });

  final double widthScreen;
  final double heightScreen;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const OrderScreen(),
                  ));
                },
                icon: const Icon(Icons.shopping_bag),
                label: const Text('Send Your Order')),
            SizedBox(
              width: widthScreen * 0.4,
              height: heightScreen * 0.15,
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Divider(),
                    const Text('Total Cost:'),
                    Text('${value.totalCostCount().toStringAsFixed(2)} €',
                        style: const TextStyle(color: Colors.redAccent)),
                    Text(
                        'inc.Vat ${value.totalCostCount().toStringAsFixed(2).addVat()} €',
                        style: const TextStyle(color: Colors.blueAccent)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
