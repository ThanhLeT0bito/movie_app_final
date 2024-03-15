import 'package:flutter/material.dart';

class ItemRadio {
  final String? text;
  final String? img;
  late bool? isSelected;

  ItemRadio({
    this.text,
    this.img,
    this.isSelected = false,
  });
}
