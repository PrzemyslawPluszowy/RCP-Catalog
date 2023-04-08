import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rcp/product_modal/product_modal.dart';
import 'package:rcp/utils/extension.dart';

class CartProvider with ChangeNotifier {
  late Box<CartProduct> hiveCart;
  Future<void> initDbCart() async {
    hiveCart = await Hive.openBox<CartProduct>('Cart');
  }

  int getProductsNumber() {
    return hiveCart.length;
  }

  bool _isProductExistInList(Product product) {
    bool isExist = hiveCart.keys
        .any((element) => product.id.toString().contains(element.toString()));
    return isExist;
  }

  Future<void> _incrementQuantity(Product product) async {
    int count = hiveCart.get(product.id)!.itemCount;
    count++;
    await hiveCart.put(
        product.id, CartProduct(product: product, itemCount: count));
    notifyListeners();
  }

  Future<void> addProductToList(Product product) async {
    if (_isProductExistInList(product)) {
      _incrementQuantity(product);
    } else {
      await hiveCart.put(product.id, CartProduct(product: product));
    }
    notifyListeners();
  }

  Future<void> removeProductFromList(Product product) async {
    if (_isProductExistInList(product)) {
      int count = hiveCart.get(product.id)!.itemCount;
      if (count == 1) {
        await hiveCart.delete(product.id);
      } else if (count > 1) {
        count--;
        await hiveCart.put(
            product.id, CartProduct(product: product, itemCount: count));
      }
      notifyListeners();
    } else {
      return;
    }
  }

  double totalCostCount() {
    double totalCost = 0;
    hiveCart.values.toList().forEach((e) {
      totalCost += (double.parse(e.product.price) * e.itemCount);
    });
    return totalCost;
  }

  String showProductPriceWithQuantity(Product product) {
    int itemCount = hiveCart.get(product.id)!.itemCount;
    double priceQuantity = itemCount * double.parse(product.price);
    return priceQuantity.toStringAsFixed(2);
  }

  String generateTextForEmail() {
    String text = '\n \n';
    hiveCart.values.toList().forEach((element) {
      text +=
          '${element.itemCount}x ${element.product.name} \n price: € ${(double.parse(element.product.price) * element.itemCount).toStringAsFixed(2)} \n link: ${element.product.permalink}\n\n';
    });
    text +=
        'total cost: ${totalCostCount().toStringAsFixed(2)} € with vat ${totalCostCount().toStringAsFixed(2).addVat()} €';
    return text;
  }

  Future<void> clearDB() async {
    await hiveCart.clear();
  }
}
