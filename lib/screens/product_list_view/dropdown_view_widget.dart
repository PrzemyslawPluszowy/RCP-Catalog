import 'package:flutter/material.dart';

class Item {
  Item(this.name, this.icon);
  final String name;
  final Widget icon;
}

List<Item> dropList = [
  Item('Grid', const Icon(Icons.grid_view)),
  Item('List', const Icon(Icons.list)),
  Item('Simple list', const Icon(Icons.list_alt)),
  Item('Big Pictures', const Icon(Icons.image)),
];

class DropdownView extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final callbackView;

  const DropdownView({super.key, required this.callbackView});

  @override
  State<DropdownView> createState() => _DropdownViewState();
}

class _DropdownViewState extends State<DropdownView> {
  String selecteMenu = dropList.first.name;
  Widget icon = const Icon(
    Icons.grid_view,
  );

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: icon,
      onSelected: (value) {
        setState(() {
          selecteMenu = value;
          widget.callbackView(selecteMenu);
          switch (selecteMenu) {
            case 'Grid':
              {
                icon = (dropList[0].icon);
              }
              break;
            case 'Simple list':
              {
                icon = (dropList[2].icon);
              }
              break;
            case 'Big Pictures':
              {
                icon = (dropList[3].icon);
              }
              break;
            case 'List':
              {
                icon = (dropList[1].icon);
              }
              break;
          }
        });
      }, //toDo fix static index
      itemBuilder: (BuildContext context) {
        return dropList
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
