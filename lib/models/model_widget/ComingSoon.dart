// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ComingSoon with ChangeNotifier{
  final String? Name;
  final String? Datetime;
  final String? TheaterLocation;
  final String? Image;

  ComingSoon({
    required this.Name,
    required this.Datetime,
    required this.TheaterLocation,
    required this.Image
  });
}