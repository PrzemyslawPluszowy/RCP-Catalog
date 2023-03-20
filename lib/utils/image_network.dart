import 'package:flutter/material.dart';

class ImgageLoading extends StatelessWidget {
  const ImgageLoading(
      {super.key, required this.imageSrc, required this.boxFit});
  final String imageSrc;
  final BoxFit boxFit;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageSrc,
      fit: boxFit,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        return child;
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
