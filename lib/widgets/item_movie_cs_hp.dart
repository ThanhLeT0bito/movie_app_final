import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_app_final/resources/app_color.dart';

class ItemMovieWidget extends StatelessWidget {
  const ItemMovieWidget({
    Key? key,
    required this.img,
    required this.name,
    required this.title,
    required this.time,
  }) : super(key: key);

  final String img;
  final String name;
  final String title;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      width: 150,
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              img,
              fit: BoxFit.cover,
              width: 150,
              height: 200,
            ),
          ),
          SizedBox(
            width: 150,
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                name,
                maxLines: 2,
                style: TextStyle(
                  color: AppColors.BaseColorMain,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Iconsax.monitor,
                  size: 16,
                  color: AppColors.BaseColorWhite,
                ),
                SizedBox(width: 5),
                Text(
                  title,
                  maxLines: 1,
                  style: TextStyle(color: AppColors.BaseColorWhite),
                )
              ],
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Iconsax.calendar,
                  size: 16,
                  color: AppColors.BaseColorWhite,
                ),
                SizedBox(width: 5),
                Text(
                  time,
                  maxLines: 1,
                  style: TextStyle(color: AppColors.BaseColorWhite),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
