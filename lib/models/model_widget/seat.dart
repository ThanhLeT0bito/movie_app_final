import 'package:flutter/material.dart';

class Seat with ChangeNotifier {
  final String name;
  late Status status;

  Seat({required this.name, this.status = Status.available});
}

enum Status {
  available,
  resered,
  selected,
}
