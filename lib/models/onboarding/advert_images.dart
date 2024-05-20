class AdImage {
  String imageUrl;
  String siteUrl;
  AdImage({required this.imageUrl, required this.siteUrl});

  factory AdImage.fromJson(Map<String, dynamic> json) {
    return AdImage(
      imageUrl: json['image_url'],
      siteUrl: json['site_url'],
    );
  }
}
