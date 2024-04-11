import 'package:carousel_images/carousel_images.dart';
import 'package:flutter/material.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> images;
  const ImageCarousel({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return CarouselImages(
      scaleFactor: 0.6,
      listImages: images,
      height: AppSizes.s300,
      borderRadius: AppBorderRadius.r20,
      cachedNetworkImage: true,
      verticalAlignment: Alignment.topCenter,
      onTap: (index) {},
    );
  }
}
