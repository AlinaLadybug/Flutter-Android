class User {
  final String id;
  final String fullName;
  final String phone;
  final String email;

  User({this.id, this.fullName, this.phone, this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return new User(
        id: json['id'] as String,
        fullName: json['fullName'] as String,
        phone: json['phone'] as String,
        email: json['email'] as String);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'phone': phone,
        'email': email,
      };
}
