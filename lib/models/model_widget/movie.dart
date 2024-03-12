import 'package:flutter/material.dart';

class Movie with ChangeNotifier {
  final String imageUrl;
  final String name;

  Movie({
    required this.imageUrl,
    required this.name,
  });
}
