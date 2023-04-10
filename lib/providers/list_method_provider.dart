import 'package:flutter/widgets.dart';

import '../product_modal/product_modal.dart';

class ListMethod with ChangeNotifier {
  late List<Product> rcpListAllProduct;
  late List<Product> _listToShow;
  late List<Product> _listToSearch;
  List<Category> _listOfcategory = [];
  late List<Product> _storegeSearchList;
  int selectedIndex = -1;

// get from provider RCP Data
  void update(List<Product> rcpProductsData) {
    rcpListAllProduct = rcpProductsData;
    _listToShow = rcpProductsData;
    _listToSearch = rcpProductsData;
  }

// init list to use in method
  void setCategoryList(int id) {
    _listToShow = getProductCategory(id);
    _listToSearch = _listToShow;
    _storegeSearchList = _listToShow;
  }

  void setFullList() {
    _listToShow = rcpListAllProduct;
    _listToSearch = rcpListAllProduct;
    _storegeSearchList = rcpListAllProduct;
  }
// List Method to show Search

  get listToShow {
    return _listToShow;
  }

  void search(String value) {
    List<Product> searchList = [];

    List<String> listString = value.split(' ');
    searchList.addAll((_listToSearch.where((product) {
      return listString.every((element) =>
          product.name.toLowerCase().contains(element.toLowerCase()));
    }).toList()));
    _listToShow = searchList;
    _storegeSearchList = searchList;
    getCategorySearchList();
    resetCategoryIndex();
    notifyListeners();
  }

  void resetCategoryIndex() {
    selectedIndex = -1;
  }

  void setCategoryIndex(int index) {
    selectedIndex = index;
  }

  getProductCategory(int idToSearch) {
    List<Product> categoryListByID = [];
    categoryListByID = rcpListAllProduct
        .where((e) => (e.categories.any((element) => element.id == idToSearch)))
        .toList();
    _listToShow = categoryListByID;
    _listToSearch = categoryListByID;
    return _listToShow;
  }

  Product getProductByID(id) {
    Product singleProduct =
        rcpListAllProduct.firstWhere((product) => product.id == id);
    return singleProduct;
  }

  List<Product> getLastProductList() {
    List<Product> lastTenProduct = [];
    List<Product> lastProductReversed = [];
    lastTenProduct.addAll(rcpListAllProduct);
    lastTenProduct.sort((a, b) => a.dateCreated!.millisecondsSinceEpoch
        .compareTo(b.dateCreated!.millisecondsSinceEpoch));
    lastTenProduct.removeRange(0, lastTenProduct.length - 5);
    lastProductReversed = lastTenProduct.reversed.toList();
    return lastProductReversed;
  }

  List<Category> showListOfAllCategory() {
    List<Category> duplicate = [];
    List<Category> categoryList = [];

    for (var element in rcpListAllProduct) {
      for (var element in element.categories) {
        duplicate.add(Category(id: element.id, name: element.name));
      }
    }
    final ids = <int>{};
    categoryList =
        duplicate.where((element) => ids.add(element.id as int)).toList();
    categoryList.sort(
      (a, b) => a.name!.compareTo(b.name as String),
    );
    return categoryList;
  }

  List<Category> getCategorySearchList() {
    List<Category> duplicate = [];
    List<Category> categoryList = [];
    for (var product in _storegeSearchList) {
      for (var element in product.categories) {
        duplicate.add(Category(id: element.id, name: element.name));
      }
    }
    final ids = <String>{};
    categoryList =
        duplicate.where((element) => ids.add(element.name as String)).toList();
    categoryList.sort(
      (a, b) => a.name!.compareTo(b.name as String),
    );

    _listOfcategory = categoryList;
    return _listOfcategory;
  }

  void showProductFilterebByCategory(
    int index,
  ) {
    if (selectedIndex == -1) {
      _listToShow = _storegeSearchList;
    } else {
      _listToShow = _storegeSearchList
          .where((product) => product.categories.any((prod) => prod.id
              .toString()
              .contains(_listOfcategory[index].id.toString())))
          .toList();
    }
    notifyListeners();
  }
}
