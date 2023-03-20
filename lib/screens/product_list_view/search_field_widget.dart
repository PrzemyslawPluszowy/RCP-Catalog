import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    required this.search,
  }) : super(key: key);

  final dynamic search;

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: const InputDecoration(
          filled: true,
          // fillColor: Theme.of(context).colorScheme.primary,
          border: OutlineInputBorder(),
          hintText: 'Enter a search term',
        ),
        onChanged: (value) {
          search(value);
        });
  }
}
