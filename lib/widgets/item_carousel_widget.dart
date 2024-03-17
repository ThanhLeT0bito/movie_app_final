import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';

class ItemCarouselWidget extends StatelessWidget {
  const ItemCarouselWidget({
    super.key,
    required this.img,
    required this.Description,
    required this.Name,
  });
  final String img;
  final String Description;
  final String Name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            img,
            fit: BoxFit.cover,
            width: 270,
            height: 400,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          Name,
          style: const TextStyle(
            color: AppColors.BaseColorWhite,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 200,
          child: Text(
            Description,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(
              color: AppColors.BaseColorWhite,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
