import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';

class ItemCategoryWidget extends StatelessWidget {
  const ItemCategoryWidget({
    super.key,
    required this.title,
    required this.navogatorName,
  });
  final String title;
  final String navogatorName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: AppColors.BaseColorWhite,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, navogatorName);
          },
          child: const Row(
            children: [
              Text('See All',
                  style:
                      TextStyle(color: AppColors.BaseColorMain, fontSize: 14)),
              SizedBox(width: 10),
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.BaseColorMain,
                size: 14,
              )
            ],
          ),
        ),
      ],
    );
  }
}
