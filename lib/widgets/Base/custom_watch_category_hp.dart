import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/screens/category_screen.dart';

class itemcaterogy_watch extends StatelessWidget {
  const itemcaterogy_watch({
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
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, navogatorName);
          },
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, CategoryScreen.routeName);
                },
                child: const Text('See All',
                    style: TextStyle(
                        color: AppColors.BaseColorMain, fontSize: 14)),
              ),
              const SizedBox(width: 10),
              const Icon(
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
