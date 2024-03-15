import 'package:flutter/material.dart';

class Nowplaying with ChangeNotifier{
  final String? Name;
  final String? Star;
  final String? Time;
  final String? Address;
  final String? Image;

  Nowplaying({
    required this.Address,
    required this.Image,
    required this.Name,
    required this.Star,
    required this.Time,
  });
}