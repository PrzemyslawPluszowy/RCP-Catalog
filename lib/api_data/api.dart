import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../product_modal/product_modal.dart';

class ApiData with ChangeNotifier {
  String consumerKey = 'ck_d30bf059b6cbbd2dcdd5234a419b6d31739feffc';
  String consumerSecret = 'cs_7b9b289458e9577d9e6f3e9fe959af06fa02e605';
  String baseLink = 'https://racingcustomparts.com/wp-json/wc/v3/';
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
        'https://racingcustomparts.com/wc-api/v3/products/count?consumer_key=ck_4d9ed797bf15515474acbbe8a8c605c438c91a82&consumer_secret=cs_6fe93aea323626368f6c1631575491fcae602273&');
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
          '${baseLink}products?consumer_key=$consumerKey&consumer_secret=$consumerSecret&per_page=50&page=$page');
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
