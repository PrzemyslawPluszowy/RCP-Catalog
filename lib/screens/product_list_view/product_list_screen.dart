import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcp/api_data/api.dart';
import 'package:rcp/screens/product_list_view/dropdown_view_widget.dart';
import 'package:rcp/screens/product_list_view/product_tile_widget.dart';
import 'package:rcp/screens/product_list_view/search_field_widget.dart';

import '../../product_modal/product.dart';

class ListProductScreen extends StatefulWidget {
  ListProductScreen(this.idCategory, this.name, {super.key});
  int? idCategory;
  String? name = '';
  static const String pageRoute = '/list-all';
  @override
  State<ListProductScreen> createState() => _ListProductScreenState();
}

class _ListProductScreenState extends State<ListProductScreen> {
  List<Product> _listToShow = [];
  List<Product> _listToSearch = [];
  String selectedView = "Grid";

  @override
  void initState() {
    if (widget.idCategory == null) {
      _listToShow = Provider.of<ApiData>(context, listen: false).listAllproduct;
      _listToSearch = _listToShow;
    } else {
      _listToShow = Provider.of<ApiData>(context, listen: false)
          .getProductCategory(widget.idCategory as int);
      _listToSearch = _listToShow;
    }
    super.initState();
  }

  void search(value) {
    setState(() {
      _listToShow = _listToSearch
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  void getSelectedView(selected) {
    setState(() {
      selectedView = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _listToShow.sort((a, b) => b.name!.compareTo(a.name!));
                });
              },
              icon: const Icon(Icons.sort))
        ],
        backgroundColor: Colors.grey[200],
        title: Text(widget.name as String),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchField(
              search: search,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                DropdownView(
                  callbackView: getSelectedView,
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _listToShow.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ProductTile(
                        listToShow: _listToShow,
                        index: index,
                        id: _listToShow[index].id!),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
