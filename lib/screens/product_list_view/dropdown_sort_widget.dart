import 'package:flutter/material.dart';

class Item {
  Item(this.name, this.icon);
  final String name;
  final Widget icon;
}

List<Item> _dropList = [
  Item('Sort by name up', const Icon(Icons.text_increase)),
  Item('Sort by name down', const Icon(Icons.text_decrease)),
  Item('Sort by date up', const Icon(Icons.date_range_sharp)),
  Item('Sort by date down', const Icon(Icons.date_range)),
];

class DropdownSort extends StatefulWidget {
  final callbackSort;

  const DropdownSort({super.key, required this.callbackSort});

  @override
  State<DropdownSort> createState() => _DropdownSortState();
}

class _DropdownSortState extends State<DropdownSort> {
  String selecteMenu = _dropList.first.name;
  Widget icon = const Icon(
    Icons.sort,
  );

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: icon,
      onSelected: (value) {
        setState(() {
          selecteMenu = value;
          widget.callbackSort(selecteMenu);
          switch (selecteMenu) {
            case 'Sort by name up':
              {
                icon = (_dropList[0].icon);
              }
              break;
            case 'Sort by name down':
              {
                icon = (_dropList[1].icon);
              }
              break;
            case 'Sort by date up':
              {
                icon = (_dropList[2].icon);
              }
              break;
            case 'Sort by date down':
              {
                icon = (_dropList[3].icon);
              }
              break;
          }
        });
      }, //toDo fix static index
      itemBuilder: (BuildContext context) {
        return _dropList
            .map((e) => PopupMenuItem(
                  value: e.name,
                  child: Text(e.name),
                ))
            .toList();
      },
      initialValue: selecteMenu,
    );
  }
}
