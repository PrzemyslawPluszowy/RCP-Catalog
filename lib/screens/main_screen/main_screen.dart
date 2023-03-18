import 'package:flutter/material.dart';
import 'package:rcp/screens/product_list_view/product_list_screen.dart';
import 'package:rcp/theme_data/color_schemes.g.dart';

import 'single_cat_grid_widget.dart';

class MainCategory {
  MainCategory(
      {required this.idCategory,
      required this.assetImage,
      required this.categoryName});
  final String categoryName;
  final String assetImage;
  final int idCategory;
}

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  static const pageRoute = '/main';

  List<MainCategory> category = [
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Wlcome to racing custom parts"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Select Category:'),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListProductScreen(
                                null,
                                'All Product',
                              ),
                            ));
                      },
                      child: Text('All Products'))
                ],
              ),
              const Divider(
                height: 5,
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(child: SingleCategoryGrid(category: category))
            ],
          ),
        ),
      ),
    );
  }
}
