import 'package:flutter/material.dart';
import 'package:rcp/product_modal/product_modal.dart';

class CategoryListIndicator extends StatefulWidget {
  const CategoryListIndicator(
      {super.key,
      required this.listOfCategory,
      required this.showListProductCatInSearch});
  final List<Category> listOfCategory;
  final showListProductCatInSearch;

  @override
  State<CategoryListIndicator> createState() => _CategoryListIndicatorState();
}

class _CategoryListIndicatorState extends State<CategoryListIndicator> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.listOfCategory.length,
      itemBuilder: (context, index) {
        return Center(
          child: Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                    widget.showListProductCatInSearch(index);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? Color.fromARGB(255, 196, 74, 98)
                        : null,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
                    child: Text(
                      widget.listOfCategory[index].name!.toUpperCase(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
