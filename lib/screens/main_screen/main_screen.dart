import 'package:flutter/material.dart';
import 'package:rcp/screens/main_screen/last_product_widget.dart';
import 'package:rcp/screens/main_screen/section_tittle_widget.dart';
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
      body: CustomScrollView(
        slivers: [
          const AppBarWidget(),
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(
              height: 10,
            ),
            const SectionTitle(title: 'Select Main Category'),
            SingleCategoryGrid(category: category),
            const SectionTitle(title: 'Newset Product'),
            const LastProductList(),
            const SectionTitle(title: 'Newset Product'),
            Row(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                      child: Material(
                        elevation: 20,
                        child: Container(
                          decoration:
                              BoxDecoration(border: Border.all(width: 0)),
                          width: 130,
                          height: 130,
                          child: Image.asset(
                            'assets/images/other/rcp-web.png',
                            fit: BoxFit.fill,
                            color: const Color.fromARGB(112, 0, 0, 0),
                            colorBlendMode: BlendMode.darken,
                          ),
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.7,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50)),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 0),
                            gradient: const LinearGradient(
                                transform: GradientRotation(-45),
                                colors: [
                                  Color.fromARGB(255, 255, 17, 0),
                                  Colors.black,
                                  Colors.black,
                                  Color.fromARGB(255, 255, 17, 0)
                                ]),
                          ),
                          width: 130,
                          height: 130,
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ]))
        ],
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      expandedHeight: 160,
      flexibleSpace: FlexibleSpaceBar(
        background: ClipRRect(
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.elliptical(300, 20)),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.black, Colors.red]),
            ),
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset(
                'assets/images/3x/logo.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
