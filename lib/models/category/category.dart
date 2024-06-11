class Category {
  String? id;
  String? name;
  String? image;

  Category({ this.id,  this.name,  this.image});
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'].toString(),
      name: json['name'].toString(),
      image: json['image'],
    );
  }
}
