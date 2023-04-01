import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcp/api_data/rcp_data_provider.dart';
import 'package:rcp/screens/product_list_view/big_picture_view.dart/big_picture_bulider.dart';
import 'package:rcp/screens/product_list_view/category_list_indicator.dart';
import 'package:rcp/screens/product_list_view/dropdown_sort_widget.dart';
import 'package:rcp/screens/product_list_view/dropdown_view_widget.dart';
import 'package:rcp/screens/product_list_view/grid_view/grid_view_widget.dart';
import 'package:rcp/screens/product_list_view/list_view/list_bulider_widget.dart';
import 'package:rcp/screens/product_list_view/search_field_widget.dart';
import 'package:rcp/screens/product_list_view/simple_list_view/simple_list_widget.dart';

import '../../product_modal/product_modal.dart';

class ListProductScreen extends StatefulWidget {
  const ListProductScreen(
    this.idCategory,
    this.categoryName, {
    super.key,
  });
  final int? idCategory;
  final String categoryName;
  static const String pageRoute = '/list-all';
  @override
  State<ListProductScreen> createState() => _ListProductScreenState();
}

class _ListProductScreenState extends State<ListProductScreen> {
  List<Product> _listToShow = [];
  List<Product> _listToSearch = [];
  List<Category> _listOfcategory = [];
  List<Product> _storegeSearchList = [];
  String selectedView = "List";
  late String sortSwitch;

  @override
  void initState() {
    if (widget.idCategory == null) {
      _listToShow =
          Provider.of<RcpData>(context, listen: false).getAllProductsList;
      _listToSearch = _listToShow;
    } else {
      _listToShow = Provider.of<RcpData>(context, listen: false)
          .getProductCategory(widget.idCategory as int);
      _listToSearch = _listToShow;
      _storegeSearchList = _listToSearch;

      getListOfCategory();
    }
    super.initState();
  }

  void search(String value) {
    List<Product> searchList = [];

    List<String> listString = value.split(' ');
    searchList.addAll((_listToSearch.where((product) {
      return listString.every((element) =>
          product.name!.toLowerCase().contains(element.toLowerCase()));
    }).toList()));
    setState(() {
      _listToShow = searchList;
      _storegeSearchList = searchList;
      getListOfCategory();
    });
  }

  void getSelectedView(selected) {
    setState(() {
      selectedView = selected;
    });
  }

  void getSelectedSwitch(selected) {
    setState(() {
      sortSwitch = selected;
      sortSwitchFunc();
    });
  }

  void showListProductCatInSearch(int index) {
    setState(() {
      _listToShow = _storegeSearchList
          .where((product) => product.categories
              .any((prod) => prod.id == _listOfcategory[index].id))
          .toList();

      getListOfCategory();
    });
  }

  void getListOfCategory() {
    List<Category> duplicate = [];
    List<Category> categoryList = [];
    for (var product in _listToShow) {
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

    setState(() {
      _listOfcategory = categoryList;
    });
  }

  Widget switchView() {
    switch (selectedView) {
      case 'Grid':
        {
          return GridBuliderView(listToShow: _listToShow);
        }
      case 'Simple list':
        {
          return SimpleListView(listToShow: _listToShow);
        }

      case 'Big Pictures':
        {
          return BigPictureBulider(listToShow: _listToShow);
        }
      case 'List':
        {
          return ListBulider(
            listToShow: _listToShow,
          );
        }
      default:
        {
          return SimpleListView(listToShow: _listToShow);
        }
    }
  }

  void sortSwitchFunc() {
    switch (sortSwitch) {
      case 'Sort by name up':
        {
          _listToShow.sort(
              (a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()));
        }
        ;

        break;
      case 'Sort by name down':
        {
          _listToShow.sort(
              (a, b) => b.name!.toLowerCase().compareTo(a.name!.toLowerCase()));
        }
        break;

      case 'Sort by date up':
        {
          _listToShow.sort(
            (a, b) => b.dateCreated!.millisecondsSinceEpoch
                .compareTo(a.dateCreated!.millisecondsSinceEpoch),
          );
        }
        break;
      case 'Sort by date down':
        {
          _listToShow.sort(
            (a, b) => a.dateCreated!.millisecondsSinceEpoch
                .compareTo(b.dateCreated!.millisecondsSinceEpoch),
          );
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool showAppBar = widget.idCategory != null ? false : true;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: showAppBar
          ? null
          : AppBar(
              elevation: null,
              scrolledUnderElevation: 0,
              surfaceTintColor: null,
              title: Text(widget.categoryName),
            ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SearchField(
              categoryName: widget.categoryName,
              search: search,
            ),
          ),
          SizedBox(
            width: 400,
            height: 35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                    child: CategoryListIndicator(
                  listOfCategory: _listOfcategory,
                  showListProductCatInSearch: showListProductCatInSearch,
                )),
                DropdownSort(callbackSort: getSelectedSwitch),
                DropdownView(
                  callbackView: getSelectedView,
                ),
              ],
            ),
          ),
          Expanded(child: switchView()),
        ],
      ),
    );
  }
}
