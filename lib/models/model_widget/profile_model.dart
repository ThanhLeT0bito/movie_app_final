import 'package:flutter/material.dart';

class Profile with ChangeNotifier {
  final String Name;
  final String Email;
  final String SDT;

  Profile({
    required this.Email,
    required this.Name,
    required this.SDT,
  });
}
