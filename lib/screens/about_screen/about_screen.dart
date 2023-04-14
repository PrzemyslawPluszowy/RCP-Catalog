import 'package:flutter/material.dart';
import 'about_app.dart';
import 'about_me_widget.dart';
import 'faq_widget.dart';

const List<Widget> tabs = [
  Text('About app'),
  Text('Faq'),
  Text('About dev'),
];

const List<Widget> about = [
  SingleChildScrollView(child: AboutApp()),
  SingleChildScrollView(child: FaqWidget()),
  SingleChildScrollView(child: AboutMe()),
];

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key, this.initialPageIndex = 1});
  final int initialPageIndex;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: initialPageIndex,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: tabs),
        ),
        body: const TabBarView(children: about),
      ),
    );
  }
}
