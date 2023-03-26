import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../product_modal/product_modal.dart';
import 'api_key/api_key.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/foundation.dart';

class ApiData with ChangeNotifier {
  List<Product> _rcpListAllProduct = [];
  int numberProduct = 0;
  int count = 0;
  late bool isInternetConnection;
  late String lastAddedProductDate;

  get listAllproduct {
    return _rcpListAllProduct;
  }

  Future<void> initData() async {
//init local DB
    Hive.registerAdapter(Prod());
    Hive.registerAdapter(CategoryAdapter());
    Hive.registerAdapter(ImageListAdapter());
    await Hive.initFlutter();

    var box = await Hive.openBox<Product>('rcpData');
    var localRCP = box.values.toList();
    // check internet connection
    isInternetConnection = await InternetConnectionChecker().hasConnection;
    // add missing products
    if (isInternetConnection == true) {
      await productCount();
      //check database number product
      if (box.values.toList().length != numberProduct) {
        await updateAllProductInDB(box);
        return;
      }
      if (box.isNotEmpty) {
        lastAddedProductDate = getDateLastAddProduct(localRCP);
        var newProducts = await getLastestAddProduct(lastAddedProductDate);

        await box.addAll(newProducts);

        _rcpListAllProduct = box.values.toList();
      } else {
        await updateAllProductInDB(box);
      }
    } else {
      if (box.isEmpty) {
        throw Exception(
            'You dont have internet connection, and dont have local copy, plase turn on internet');
      } else {
        _rcpListAllProduct = box.values.toList();
      }
    }
  }

  Future getLastestAddProduct(String dataProduct) async {
    var url = Uri.parse(
        '${baseLink}wp-json/wc/v3/products?consumer_key=$consumerKey&consumer_secret=$consumerSecret&after=$lastAddedProductDate');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> getArray2 = await json.decode(response.body);
      List<Product> newsetAddProducts =
          getArray2.map((e) => Product.fromJson(e)).toList();
      return newsetAddProducts;
    } else if (response.statusCode >= 400) {
      throw Exception(response.statusCode);
    }
  }

  Future updateAllProductInDB(Box<Product> box) async {
    count = 0;
    await box.clear();
    await getRCPdata();
    await box.addAll(_rcpListAllProduct);
  }

  getDateLastAddProduct(List<Product> listToSort) {
    List<Product> filtered = [];
    filtered.addAll(listToSort);
    filtered.sort(
      (b, a) {
        return a.dateCreated!.microsecondsSinceEpoch
            .compareTo(b.dateCreated!.microsecondsSinceEpoch);
      },
    );
    return filtered.first.dateCreated!.toIso8601String();
  }

  Future productCount() async {
    var url = Uri.parse(
        '${baseLink}wc-api/v3/products/count?consumer_key=$consumerKey&consumer_secret=$consumerSecret');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      var itemCount = jsonDecode(response.body);
      numberProduct = (itemCount['count']);
      notifyListeners();
    } else if (response.statusCode >= 400) {
      throw Exception(response.statusCode);
    }
  }

  Future<void> getRCPdata() async {
    count = 0;
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
      } else if (response.statusCode >= 400) {
        throw Exception(response.statusCode);
      }
      notifyListeners();
    }
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
