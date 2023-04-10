import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcp/providers/cart_provider.dart';
import 'package:rcp/screens/cart_screen/cart_screen.dart';
import 'package:rcp/screens/category_screen/category_screen.dart';
import 'package:rcp/screens/product_list_view/product_list_screen.dart';

import 'main_screen.dart';

class MainCategory {
  MainCategory(
      {required this.idCategory,
      required this.assetImage,
      required this.categoryName});
  final String categoryName;
  final String assetImage;
  final int idCategory;
}

class MainScreenBootomBar extends StatefulWidget {
  const MainScreenBootomBar({super.key});
  static const pageRoute = '/main';

  @override
  State<MainScreenBootomBar> createState() => _MainScreenBootomBarState();
}

class _MainScreenBootomBarState extends State<MainScreenBootomBar> {
  Future<void> _onItemTapped(int index) async {
    Timer.run(() {
      setState(() {
        _selectedIndex = index;
      });
    });
  }

  late List<BottomNavigationBarItem> bottomNagigation =
      <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'RCP Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.chat),
      label: 'Category',
    ),
    const BottomNavigationBarItem(
      icon: BageIcon(),
      label: 'Cart',
    ),
  ];

  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const MainScreen(),
    const ListProductScreen(null, 'Catalog'),
    const CategoryScreen(),
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          enableFeedback: true,
          elevation: 2,
          type: BottomNavigationBarType.fixed,
          items: bottomNagigation,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        appBar: _selectedIndex == 0
            ? null
            : AppBar(
                backgroundColor: Theme.of(context).colorScheme.background,
                automaticallyImplyLeading: false,
                title: Text(bottomNagigation[_selectedIndex].label as String),
              ),
        body: Container(
          child: _pages.elementAt(_selectedIndex),
        ));
  }
}

class BageIcon extends StatelessWidget {
  final int count = 0;

  const BageIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, child) => Badge.count(
        count: value.getProductsNumber(),
        child: const Icon(Icons.shop),
      ),
    );
  }
}
