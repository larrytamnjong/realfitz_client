class User {
  int? id;
  String? name;
  String? phone;
  String? password;
  String? email;
  String? countryCode;
  String? country;
  String? creationDate;

  User(
      {this.id,
      this.name,
      this.phone,
      this.password,
      this.email,
      this.countryCode,
      this.country,
      this.creationDate});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        phone: json['phone'] ?? '',
        password: json['password'] ?? '',
        email: json['email'] ?? '',
        countryCode: json['country_code'] ?? '',
        country: json['country'] ?? '',
        creationDate: json['creation_date']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id ?? '',
      'name': name ?? '',
      'phone': phone ?? '',
      'password': password ?? '',
      'email': email ?? '',
      'country_code': countryCode ?? '',
      'country': country ?? '',
      'creation_date': creationDate ?? ''
    };
  }
}
