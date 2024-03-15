// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Ticket with ChangeNotifier {
  final String MovieName;
  final String DateTime;
  final String TheaterLocation;
  final String Image;

  Ticket({
    required this.MovieName,
    required this.DateTime,
    required this.TheaterLocation,
    required this.Image,
  });
}
