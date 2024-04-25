import 'package:flutter/material.dart';

class Users with ChangeNotifier {
  final String? id;
  final String name;
  final String phone;
  final String? mail;
  final String? urlImage;
  Users(
      {this.id,
      required this.name,
      required this.phone,
      this.mail,
      this.urlImage});
  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
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
