import 'package:flutter/material.dart';

class DateSeat with ChangeNotifier {
  final String day;
  final String month;
  late bool? isSelected;

  DateSeat({required this.day, required this.month, this.isSelected = false});
}
