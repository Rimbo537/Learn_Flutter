class User {
  int id;
  String name;
  String? email;
  String? phone;

  User({
    required this.id,
    required this.name,
    this.email,
    this.phone,
  });

// создаем метод, который получает json и преобразовует в обьекты dart
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'] ?? '',
      phone: json['phone'] ?? '' ,
    );
  }
}
