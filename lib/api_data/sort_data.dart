import 'package:flutter/material.dart';

import '../product_modal/product.dart';

class SortData with ChangeNotifier {
  // List<Product> getProductCategory(
  //     {required int idToSearch, required List<Product> listProductToSearch}) {
  //   List<Product> categoryListByID = [];
  //   categoryListByID = listProductToSearch
  //       .where((e) => (e.categories.any((element) => element.id == idToSearch)))
  //       .toList();

  //   return categoryListByID;
  // }

  List<Product> sortUpName(List<Product> listToSort) {
    listToSort.sort((a, b) => a.name!.compareTo(b.name!));
    notifyListeners();
    return listToSort;
  }

  void sortDownName(List<Product> listToSort) {
    listToSort.sort((a, b) => b.name!.compareTo(a.name!));
    notifyListeners();
  }
}
