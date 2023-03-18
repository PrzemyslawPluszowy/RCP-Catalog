import 'package:flutter/material.dart';
import 'package:rcp/screens/product_list_view/product_list_screen.dart';

import 'main_screen.dart';

class SingleCategoryGrid extends StatelessWidget {
  const SingleCategoryGrid({
    super.key,
    required this.category,
  });

  final List<MainCategory> category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: GridView.builder(
        itemCount: category.length,
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 2 / 3,
            mainAxisSpacing: 5,
            maxCrossAxisExtent: double.infinity),
        itemBuilder: (context, index) => InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ListProductScreen(
                  category[index].idCategory,
                  category[index].categoryName,
                ),
              )),
          child: GridTile(
            child: Container(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  category[index].assetImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
