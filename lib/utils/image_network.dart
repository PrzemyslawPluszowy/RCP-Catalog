import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImgageLoading extends StatelessWidget {
  const ImgageLoading(
      {super.key, required this.imageSrc, required this.boxFit});
  final String imageSrc;
  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: boxFit,
      imageUrl: imageSrc,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: CircularProgressIndicator(
        value: downloadProgress.progress,
        strokeWidth: 3.0,
      )),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
