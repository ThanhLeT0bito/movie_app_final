import 'package:flutter/material.dart';

class User with ChangeNotifier {
  final String id;
  final String name;
  final String phone;
  User({
    required this.id,
    required this.name,
    required this.phone,
  });
}
