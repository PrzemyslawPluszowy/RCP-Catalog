import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class CaruselInMain extends StatelessWidget {
  CaruselInMain({
    super.key,
  });
  final List<String> imgList = [
    'assets/images/tsunami.jpeg',
    'assets/images/ebay.jpeg',
    'assets/images/drag.jpeg',
  ];
  final List<String> textCarusel = [
    'Parts tested in dragster Tsunami 2200hp',
    'All of our products can be ordered and paid via the Paypal and Ebay',
    'We Are official sponsors www.dragracing.pl',
  ];
  final List<Uri> _url = [
    Uri.parse('https://mickey-garage.com/'),
    Uri.parse(
        'https://www.ebay.com/str/racingcustomparts?fbclid=IwAR1M6aZgNiu0ZauIWg4KXAWxa-zAvtPg3SbptFfB6qPsWPJiYTNUF3ekz5Y'),
    Uri.parse('https://www.dragracing.pl/'),
  ];
  Future<void> _launchUrl(int index) async {
    if (!await launchUrl(_url[index])) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          return GestureDetector(
            onTap: () async {
              _launchUrl(index);
            },
            child: Stack(
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
            ),
          );
        },
      ),
    );
  }
}
