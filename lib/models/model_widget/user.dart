import 'package:flutter/material.dart';

class User with ChangeNotifier {
  final String id;
  final String name;
  final String phone;
  final String mail;
  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.mail,
  });
}
