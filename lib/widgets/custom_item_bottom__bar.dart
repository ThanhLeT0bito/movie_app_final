import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';

class CustomItemBottomBar extends StatelessWidget {
  CustomItemBottomBar({
    super.key,
    required this.icon,
    required this.label,
    this.isSelected,
  });

  final IconData icon;
  final String label;
  late bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Column(
        children: [
          Icon(
            icon,
            size: 32,
            color: isSelected!
                ? AppColors.BaseColorMain
                : AppColors.BaseColorWhite,
          ),
          Text(
            label,
            style: TextStyle(
                color: isSelected!
                    ? AppColors.BaseColorMain
                    : AppColors.BaseColorWhite,
                fontSize: 15),
          )
        ],
      ),
    );
  }
}
