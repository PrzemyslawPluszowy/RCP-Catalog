import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../product_modal/product_modal.dart';

class FullScreenSlider extends StatelessWidget {
  const FullScreenSlider(
      {super.key,
      required this.imageList,
      required this.initialIndex,
      required this.name});
  final List<ImageList>? imageList;
  final int initialIndex;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return CarouselSlider(
            options: CarouselOptions(
              initialPage: initialIndex,
              height: height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              // autoPlay: false,
            ),
            items: imageList!
                .map((item) => Center(
                        child: Image.network(
                      item.src as String,
                      fit: BoxFit.fitWidth,
                      height: height,
                    )))
                .toList(),
          );
        },
      ),
    );
  }
}
