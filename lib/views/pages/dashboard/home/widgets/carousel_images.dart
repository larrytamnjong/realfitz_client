import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return SizedBox(
        height: size.height * 0.2,
        width: size.width,
        child: CarouselSlider(
          options: CarouselOptions(
              // aspectRatio: 18/9,
              // viewportFraction: 0.9,
              initialPage: 0,
              // aspectRatio: 16/9,
              viewportFraction: .90,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
              height: size.height * 0.3),
          items: imageUrls.map((url) {
            return Builder(
              builder: (BuildContext context) {
                int index = imageUrls.indexOf(url);
                return ImageItem(
                    imageUrl: url,
                    urlString: images != null ? images![index].siteUrl : null);
              },
            );
          }).toList(),
        ) /* Carousel(
        indicatorBarColor: AppColors.white,
        autoScrollDuration: const Duration(seconds: 2),
        animationPageDuration: const Duration(milliseconds: 500),
        activateIndicatorColor: AppColors.primary,
        animationPageCurve: Curves.easeIn,
        indicatorBarHeight: 15,
        indicatorHeight: 5,
        indicatorWidth: 5,

        unActivatedIndicatorColor: AppColors.grey,
        stopAtEnd: false,
        autoScroll: true,
        items: imageUrls.map((url) {
          int index = imageUrls.indexOf(url);
          return ImageItem(
              imageUrl: url,
              urlString: images != null ? images![index].siteUrl : null);
        }).toList(),
      ),*/
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
      child: Container(
        width: Get.width * 0.9,
        margin: EdgeInsets.symmetric(horizontal: AppPadding.p3),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.fill,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              SizedBox(
                  height: 40,
                  width: 40,
                  child: Center(
                      child: CircularProgressIndicator(
                    // value: downloadProgress.progress,
                    color: AppColors.primary,
                  ))),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
      onTap: () {
        launchExternalUrl(urlString: urlString!);
      },
    );
  }
}
