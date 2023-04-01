import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:rcp/api_data/rcp_data_provider.dart';
import 'package:rcp/product_modal/product_modal.dart';
import 'package:rcp/screens/product_list_view/product_list_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Category> _categoryList = [];
  @override
  void initState() {
    _categoryList =
        Provider.of<RcpData>(context, listen: false).getListOfCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _categoryList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Divider(),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ListProductScreen(
                        _categoryList[index].id,
                        _categoryList[index].name as String),
                  ));
                },
                child: ListTile(
                  leading: Container(
                      child: Image.asset(
                    'assets/images/logo.png',
                    scale: 2,
                    color: Colors.grey,
                  )),
                  title: Center(
                    child: Text(_categoryList[index].name!.toUpperCase()),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
