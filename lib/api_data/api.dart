import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../product_modal/product_modal.dart';
import 'api_key/api_key.dart';

class ApiData with ChangeNotifier {
  final List<Product> _rcpListAllProduct = [];
  final List<Product> _rcpCategoryList = [];
  int numberProduct = 0;
  int count = 0;

  get listAllproduct {
    return _rcpListAllProduct;
  }

  get listCategoryProduct {
    return _rcpCategoryList;
  }

  Future productCount() async {
    var url = Uri.parse(
        '${baseLink}wc-api/v3/products/count?consumer_key=$consumerKey&consumer_secret=$consumerSecret');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var itemCount = jsonDecode(response.body);
      numberProduct = (itemCount['count']);
      notifyListeners();
    }
  }

  Future<void> getRCPdata() async {
    int page = 1;
    bool breakFetch = false;
    while (!breakFetch) {
      var url = Uri.parse(
          '${baseLink}wp-json/wc/v3/products?consumer_key=$consumerKey&consumer_secret=$consumerSecret&per_page=50&page=$page');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> getArray = await json.decode(response.body);
        List<Product> rcp = getArray.map((e) => Product.fromJson(e)).toList();
        if (rcp.isNotEmpty) {
          _rcpListAllProduct.addAll(rcp);
          page++;
          count = _rcpListAllProduct.length;
        } else {
          breakFetch = true;
          page = 1;
          return;
        }
      } else {}
      notifyListeners();
    }
  }

  List<Product> getProductCategory(int idToSearch) {
    List<Product> categoryListByID = [];
    categoryListByID = _rcpListAllProduct
        .where(
            (e) => (e.categories!.any((element) => element.id == idToSearch)))
        .toList();
    return categoryListByID;
  }

  Product getProductByID(id) {
    Product singleProduct =
        _rcpListAllProduct.firstWhere((product) => product.id as int == id);

    return singleProduct;
  }
}
