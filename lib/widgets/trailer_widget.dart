import 'package:flutter/material.dart';

import '../resources/app_color.dart';

class TrailerWidget extends StatelessWidget {
  const TrailerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(
        maxHeight: 300,
      ),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.transparent, // Thay đổi màu thành trong suốt
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
              image: AssetImage('assets/images/t4.png'), fit: BoxFit.fitWidth)),
      child: const Center(
        child: Icon(
          Icons.play_circle_outline_rounded,
          color: AppColors.BaseColorWhite,
          size: 64,
        ),
      ),
    );
  }
}
