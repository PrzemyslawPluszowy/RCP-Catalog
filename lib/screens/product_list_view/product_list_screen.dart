import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcp/api_data/api.dart';
import 'package:rcp/screens/product_list_view/dropdown_view_widget.dart';
import 'package:rcp/screens/product_list_view/grid_view/grid_view_widget.dart';
import 'package:rcp/screens/product_list_view/list_view/list_bulider_widget.dart';
import 'package:rcp/screens/product_list_view/search_field_widget.dart';

import '../../product_modal/product_modal.dart';

class ListProductScreen extends StatefulWidget {
  ListProductScreen(this.idCategory, this.name, {super.key});
  int? idCategory;
  String name = '';
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

  void search(String value) {
    setState(() {
      List<String> wordList = [];
      value.split(' ').forEach((word) {
        _listToShow = _listToSearch
            .where(
              (element) => element.name!.toLowerCase().contains(
                    word.toLowerCase(),
                  ),
            )
            .toList();
      });
    });
  }

  void getSelectedView(selected) {
    setState(() {
      selectedView = selected;
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
          return GridBuliderView(listToShow: _listToShow);
        }

      case 'Big Pictures':
        {
          return GridBuliderView(listToShow: _listToShow);
        }
        break;
      case 'List':
        {
          return ListBulider(
            listToShow: _listToShow,
          );
        }
      default:
        {
          return ListBulider(listToShow: _listToShow);
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DropdownView(
                  callbackView: getSelectedView,
                )
              ],
            ),
          ),
          Expanded(child: switchView()),
        ],
      ),
    );
  }
}
