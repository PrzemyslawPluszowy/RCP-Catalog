import 'package:flutter/material.dart';
import 'package:rcp/screens/main_screen/last_product_widget.dart';
import 'package:rcp/screens/main_screen/single_cat_grid_widget.dart';

import '../product_list_view/product_list_screen.dart';
import 'main_bottombar_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final List<MainCategory> category = [
    MainCategory(
        assetImage: 'assets/images/category/engine-new.jpg',
        categoryName: 'Engine',
        idCategory: 20),
    MainCategory(
        assetImage: 'assets/images/category/Gearboxnew.jpg',
        categoryName: 'GearBox',
        idCategory: 35),
    MainCategory(
        assetImage: 'assets/images/category/Brakes-adpater.jpg',
        categoryName: 'Breake adapter',
        idCategory: 371),
    MainCategory(
        assetImage: 'assets/images/category/Laser-cutting2.jpg',
        categoryName: 'Laser cut parts',
        idCategory: 35),
    MainCategory(
        assetImage: 'assets/images/category/others2-1.jpg',
        categoryName: 'Others parts',
        idCategory: 35)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Select Category:'),
                ],
              ),
              const Divider(
                height: 5,
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(child: SingleCategoryGrid(category: category)),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Select Category:'),
                ],
              ),
              const Divider(
                height: 5,
              ),
              const SizedBox(
                height: 15,
              ),
              LastProductList()
            ],
          ),
        ),
      ),
    );
  }
}
