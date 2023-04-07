import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rcp/screens/product_overview/full_screen_slider_screen.dart';

import '../../product_modal/product_modal.dart';
import '../../utils/image_network.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    super.key,
    required this.height,
    required this.imagesList,
    required this.name,
  });
  final String name;
  final double height;
  final List<ImageList>? imagesList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35 - height,
      decoration: const BoxDecoration(),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: CarouselSlider.builder(
        itemCount: imagesList!.length,
        itemBuilder: (context, index, realIndex) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FullScreenSlider(
                    name: name,
                    imageList: imagesList,
                    initialIndex: index,
                  ),
                ));
              },
              child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: ImgageLoading(
                        imageSrc: imagesList![index].src as String,
                        boxFit: BoxFit.cover),
                  )),
            ),
          );
        },
        options: CarouselOptions(
          height: 250,
          aspectRatio: 3.0,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.scale,
          enlargeFactor: 0.2,
        ),
      ),
    );
  }
}
