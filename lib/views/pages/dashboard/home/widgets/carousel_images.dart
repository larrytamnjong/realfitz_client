import 'package:carousel_images/carousel_images.dart';
import 'package:flutter/material.dart';
import 'package:realfitzclient/models/onboarding/AdImages.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';

import '../../../../../constants/image_paths.dart';
import '../../../../../utils/launch_url.dart';

class ImageCarousel extends StatelessWidget {
  final List<AdImage>? images;
  const ImageCarousel({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = [];
    if (images != null) {
      for (var image in images!) {
        imageUrls.add(image.imageUrl);
      }
    } else {
      imageUrls = <String>[
        ImagePaths.womanRunning,
        ImagePaths.manWomanStretching,
        ImagePaths.smileyWomanJogging,
        ImagePaths.manWomanJogging
      ];
    }
    return CarouselImages(
      scaleFactor: 0.6,
      listImages: imageUrls,
      height: AppSizes.s300,
      borderRadius: AppBorderRadius.r20,
      cachedNetworkImage: true,
      verticalAlignment: Alignment.topCenter,
      onTap: (index) {
        if (images != null) {
          launchExternalUrl(urlString: images![index].siteUrl);
        }
      },
    );
  }
}
