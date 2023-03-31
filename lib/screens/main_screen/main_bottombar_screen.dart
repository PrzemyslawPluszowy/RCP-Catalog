import 'package:flutter/material.dart';
import 'package:rcp/screens/category_screen/category_screen.dart';
import 'package:rcp/screens/product_list_view/product_list_screen.dart';

import 'main_screen.dart';
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

class MainScreenBootomBar extends StatefulWidget {
  const MainScreenBootomBar({super.key});
  static const pageRoute = '/main';

  @override
  State<MainScreenBootomBar> createState() => _MainScreenBootomBarState();
}

class _MainScreenBootomBarState extends State<MainScreenBootomBar> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 0;

  final List<BottomNavigationBarItem> bottomNagigation =
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
  ];

  static final List<Widget> _pages = <Widget>[
    MainScreen(),
    const ListProductScreen(null, 'Catalog'),
    const CategoryScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
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
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ));
  }
}
