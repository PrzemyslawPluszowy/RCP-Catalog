import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rcp/providers/list_method_provider.dart';
import 'package:rcp/product_modal/product_modal.dart';

class CategoryListIndicator extends StatefulWidget {
  CategoryListIndicator({
    Key? key,
    required this.listOfCategory,
  }) : super(key: key);
  final List<Category> listOfCategory;

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
                width: 2,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    if (selectedIndex == index) {
                      selectedIndex = -1;
                    } else {
                      selectedIndex = index;
                    }
                    Provider.of<ListMethod>(context, listen: false)
                        .showProductFilterebByCategory(index, selectedIndex);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? const Color.fromARGB(255, 196, 74, 98)
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
