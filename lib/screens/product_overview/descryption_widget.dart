import 'package:flutter/material.dart';
import 'package:html/parser.dart';

class DescryptionWidget extends StatelessWidget {
  const DescryptionWidget({super.key, required this.shortDescryption});
  final String shortDescryption;
  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;
    return parsedString;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          _parseHtmlString(shortDescryption),
        ),
      ),
    );
  }
}
