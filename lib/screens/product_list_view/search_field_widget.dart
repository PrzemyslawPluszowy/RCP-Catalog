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
          fillColor: Colors.white,
          border: OutlineInputBorder(),
          hintText: 'Enter a search term',
        ),
        onChanged: (value) {
          search(value);
        });
  }
}
