import 'package:flutter/material.dart';

class TimeSeat with ChangeNotifier {
  final String time;
  late bool? isSelected;

  TimeSeat({required this.time, this.isSelected = false});
}
