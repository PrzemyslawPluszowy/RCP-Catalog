import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcp/api_data/list_method_provider.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    // required this.search,
    required this.categoryName,
  }) : super(key: key);

  // final search;
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
          Provider.of<ListMethod>(context, listen: false).search(value);
        });
  }
}
