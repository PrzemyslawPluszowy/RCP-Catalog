import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcp/api_data/rcp_data_provider.dart';
import 'package:rcp/product_modal/product_modal.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Category> categoryList = [];
  @override
  void initState() {
    categoryList =
        Provider.of<RcpData>(context, listen: false).getListOfCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: CupertinoPicker(
        looping: true,
        magnification: 1.22,
        squeeze: 0.5,
        useMagnifier: false,
        itemExtent: 23,
        onSelectedItemChanged: (int value) {},
        children: categoryList
            .map((e) => Text(
                  e.name as String,
                ))
            .toList(),
      ),
    ));
  }
}
