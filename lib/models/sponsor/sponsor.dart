class Sponsor {
  int? id;
  String? name;
  String? image;
  String? detail;
  int? categoryId;

  Sponsor({
    this.id,
    this.name,
    this.image,
    this.detail,
    this.categoryId,
  });
  factory Sponsor.fromJson(Map<String, dynamic> json) {
    return Sponsor(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      detail: json['detail'],
      categoryId: json['category_id'],
    );
  }
}
