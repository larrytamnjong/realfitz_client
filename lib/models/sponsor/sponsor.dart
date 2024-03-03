class Sponsor {
  String id;
  String name;
  String? image;
  String? detail;
  String? categoryId;

  Sponsor({
    required this.id,
    required this.name,
    this.image,
    this.detail,
    this.categoryId,
  });
  factory Sponsor.fromJson(Map<String, dynamic> json) {
    return Sponsor(
      id: json['id'].toString(),
      name: json['name'],
      image: json['image'],
      detail: json['detail'],
      categoryId: json['category_id']?.toString(),
    );
  }
}
