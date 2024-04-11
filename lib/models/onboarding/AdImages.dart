class AdImages {
  List<String> imageUrls;

  AdImages({
    required this.imageUrls,
  });

  factory AdImages.fromJson(List<dynamic> json) {
    List<String> urls = List<String>.from(json);
    return AdImages(
      imageUrls: urls,
    );
  }
}
