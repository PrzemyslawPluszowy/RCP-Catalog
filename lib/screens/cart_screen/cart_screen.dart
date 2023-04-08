import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcp/providers/cart_provider.dart';
import 'package:rcp/screens/cart_screen/total_price_widget.dart';
import 'package:rcp/utils/image_network.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double padding = 4;
    var heightAppBar = AppBar().preferredSize.height;

    double widthScreen = MediaQuery.of(context).size.width - (padding * 2);
    double heightScreen = MediaQuery.of(context).size.height - heightAppBar;
    return Scaffold(
      // appBar: AppBar(automaticallyImplyLeading: false),
      body: Consumer<CartProvider>(builder: (context, value, child) {
        var listProductCart = value.hiveCart.values.toList();
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: heightScreen * 0.65,
                child: ListView.builder(
                  itemCount: value.hiveCart.length,
                  itemBuilder: (context, index) => Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: widthScreen * 0.2,
                            child: ImgageLoading(
                                imageSrc: listProductCart[index]
                                    .product
                                    .images
                                    .first
                                    .src as String,
                                boxFit: BoxFit.cover),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          SizedBox(
                            width: widthScreen * 0.48,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                      '${listProductCart[index].product.name}',
                                      softWrap: true),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                    '€ ${value.showProductPriceWithQuantity(listProductCart[index].product)}')
                              ],
                            ),
                          ),
                          SizedBox(
                            width: widthScreen * 0.3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: widthScreen * 0.1,
                                  child: IconButton(
                                      onPressed: () {
                                        value.addProductToList(
                                            listProductCart[index].product);
                                      },
                                      icon: const Icon(Icons.add)),
                                ),
                                SizedBox(
                                  child: Text(
                                    '${listProductCart[index].itemCount}x ',
                                    textScaleFactor: 1.2,
                                  ),
                                ),
                                SizedBox(
                                  width: widthScreen * 0.1,
                                  child: IconButton(
                                    onPressed: () {
                                      value.removeProductFromList(
                                          listProductCart[index].product);
                                    },
                                    icon: const Icon(
                                      Icons.remove,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider()
                    ],
                  ),
                ),
              ),
              TotalPriceWidget(
                  widthScreen: widthScreen, heightScreen: heightScreen)
            ],
          ),
        );
      }),
    );
  }
}
