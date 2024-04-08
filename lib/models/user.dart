import 'package:flutter/material.dart';

class User with ChangeNotifier {
  final String? id;
  final String name;
  final String phone;
  final String? mail;
  final String? urlImage;
  User(
      {this.id,
      required this.name,
      required this.phone,
      this.mail,
      this.urlImage});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['_id'],
        name: json['name'],
        phone: json['phone'],
        mail: json['mail'],
        urlImage: json['urlImage']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'phone': phone, 'mail': mail, 'urlImage': urlImage};
  }
}
