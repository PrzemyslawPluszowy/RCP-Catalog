import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rcp/screens/loading_screen/loading_screen.dart';

class CaruselInMain extends StatelessWidget {
  CaruselInMain({
    super.key,
  });
  final List<String> imgList = [
    'assets/images/tsunami.jpeg',
    'assets/images/ebay.jpeg',
    'assets/images/maps.jpeg',
  ];
  final List<String> textCarusel = [
    'Parts tested in dragster Tsunami 2200hp',
    'All of our products can be ordered and paid via the Paypal and Ebay',
    'We work with customers all over the world',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      child: CarouselSlider.builder(
        itemCount: imgList.length,
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 3.0,
          enlargeCenterPage: true,
        ),
        itemBuilder: (ctx, index, realIdx) {
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurStyle: BlurStyle.normal,
                          blurRadius: 2,
                          color: Colors.red,
                          spreadRadius: 3,
                          offset: Offset(1, 1))
                    ]),
                    width: double.infinity,
                    child: Image.asset(
                      imgList[index],
                      fit: BoxFit.cover,
                    )),
              ),
              Center(
                child: Container(
                  width: double.infinity,
                  color: const Color.fromARGB(166, 0, 0, 0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      textCarusel[index],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
