import 'dart:convert';
import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rcp/product_modal/category.dart';
import 'package:rcp/product_modal/image.dart';

import '../product_modal/product.dart';

class ApiData with ChangeNotifier {
  String consumerKey = 'ck_d30bf059b6cbbd2dcdd5234a419b6d31739feffc';
  String consumerSecret = 'cs_7b9b289458e9577d9e6f3e9fe959af06fa02e605';
  String baseLink = 'https://racingcustomparts.com/wp-json/wc/v3/';
  List<Product> _rcpListAllProduct = [];
  List<Product> _rcpCategoryList = [];

  late int loadingAllProductStatus;

  get listAllproduct {
    return _rcpListAllProduct;
  }

  get listCategoryProduct {
    return _rcpCategoryList;
  }

  Future<void> getRCPdata2() async {
    List<Product> rcp = [];
    int page = 1;
    final url = Uri.parse(
        '${baseLink}products?consumer_key=$consumerKey&consumer_secret=$consumerSecret&per_page=99&page=$page');
    final responseUrl = await http.get(url);
    var data = jsonDecode(responseUrl.body).toString();
  }

  Future<void> getRCPdata() async {
    int page = 1;
    bool breakFetch = false;
    List<Product> rcp = [];

    while (!breakFetch) {
      loadingAllProductStatus = page;
      final url = Uri.parse(
          '${baseLink}products?consumer_key=$consumerKey&consumer_secret=$consumerSecret&per_page=99&page=$page');
      final responseUrl = await http.get(url);
      var dataFromPage = await json.decode(responseUrl.body) as List<dynamic>;
      if (dataFromPage.isEmpty) {
        breakFetch = true;
        _rcpListAllProduct = rcp;
        page = 1;
        notifyListeners();
      } else {
        dataFromPage.forEach((product) {
          rcp.add(
            Product(
              name: product['name'],
              id: product['id'],
              categories: (product['categories'] as List<dynamic>)
                  .map((e) => Category.fromJson(e as Map<String, dynamic>))
                  .toList(),
              images: (product['images'] as List<dynamic>)
                  .map((e) => ImageList.fromJson(e as Map<String, dynamic>))
                  .toList(),
              price: product['price'],
              dateCreated: product['dateCreated'],
              description: product['description'],
              shortDescription: product['short_description'],
            ),
          );
        });
      }

      page++;
    }
    notifyListeners();
  }

  List<Product> getProductCategory(int idToSearch) {
    List<Product> categoryListByID = [];
    categoryListByID = _rcpListAllProduct
        .where((e) => (e.categories.any((element) => element.id == idToSearch)))
        .toList();
    return categoryListByID;
  }

  Product getProductByID(id) {
    Product singleProduct =
        _rcpListAllProduct.firstWhere((product) => product.id as int == id);

    return singleProduct;
  }
}
