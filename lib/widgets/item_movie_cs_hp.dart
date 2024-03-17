import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_app_final/resources/app_color.dart';

class ItemMovieWidget extends StatelessWidget {
  const ItemMovieWidget({
    super.key,
  });

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
              "assets/img_1.jpg",
              fit: BoxFit.cover,
              width: 150,
              height: 200,
            ),
          ),
          const SizedBox(
            width: 150,
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Doreamon: The Way of Water",
                maxLines: 2,
                style: TextStyle(
                    color: AppColors.BaseColorMain,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
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
                  "Adventure, Dci-fi",
                  maxLines: 1,
                  style: TextStyle(color: AppColors.BaseColorWhite),
                )
              ],
            ),
          ),
          const SizedBox(height: 5),
          const SizedBox(
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
                  "18.03.2024",
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
