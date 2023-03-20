import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    required this.search,
    required this.categoryName,
  }) : super(key: key);

  final dynamic search;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
          filled: true,
          // fillColor: Theme.of(context).colorScheme.primary,
          border: const OutlineInputBorder(),
          hintText: 'Enter search in ${categoryName.toLowerCase()}',
        ),
        onChanged: (value) {
          search(value);
        });
  }
}
