import 'package:flutter/material.dart';
import 'package:flutter_image_slider/carousel.dart';
import 'package:realfitzclient/models/onboarding/advert_images.dart';
import 'package:realfitzclient/views/resources/values_manager.dart';

import '../../../../../constants/api_urls.dart';
import '../../../../../constants/image_paths.dart';
import '../../../../../utils/launch_url.dart';
import '../../../../resources/colors_manager.dart';

class ImageCarousel extends StatelessWidget {
  final List<AdImage>? images;
  const ImageCarousel({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> imageUrls = [];
    if (images != null) {
      for (var image in images!) {
        imageUrls.add('$networkImageUrl${image.imageUrl}');
      }
    } else {
      imageUrls = <String>[
        ImagePaths.womanRunning,
        ImagePaths.manWomanStretching,
        ImagePaths.smileyWomanJogging,
        ImagePaths.manWomanJogging
      ];
    }
    return Card(
      color: AppColors.white,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.r20)),
      child: SizedBox(
        height: size.height * 0.3,
        width: size.width,
        child: Carousel(
          indicatorBarColor: AppColors.palePrimary,
          autoScrollDuration: const Duration(seconds: 2),
          animationPageDuration: const Duration(milliseconds: 500),
          activateIndicatorColor: AppColors.primary,
          animationPageCurve: Curves.easeIn,
          indicatorBarHeight: 15,
          indicatorHeight: 5,
          indicatorWidth: 5,
          unActivatedIndicatorColor: AppColors.white,
          stopAtEnd: false,
          autoScroll: true,
          items: imageUrls.map((url) {
            int index = imageUrls.indexOf(url);
            return ImageItem(
                imageUrl: url,
                urlString: images != null ? images![index].siteUrl : null);
          }).toList(),
        ),
      ),
    );

    //   CarouselImages(
    //   viewportFraction: 1.0,
    //   scaleFactor: 1.0,
    //   listImages: imageUrls,
    //   height: 218, //AppSizes.s300,
    //   borderRadius: AppBorderRadius.r20,
    //   cachedNetworkImage: true,
    //   verticalAlignment: Alignment.topCenter,
    //   onTap: (index) {
    //     if (images != null) {
    //       launchExternalUrl(urlString: images![index].siteUrl);
    //     }
    //   },
    // );
  }
}

class ImageItem extends StatelessWidget {
  const ImageItem({
    super.key,
    required this.imageUrl,
    required this.urlString,
  });

  final String imageUrl;
  final String? urlString;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Image(
        image: NetworkImage(imageUrl),
      ),
      onTap: () {
        launchExternalUrl(urlString: urlString!);
      },
    );
  }
}
