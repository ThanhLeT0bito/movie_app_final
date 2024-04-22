import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';

class ItemCarouselWidget extends StatelessWidget {
  const ItemCarouselWidget({
    super.key,
    required this.id,
    required this.img,
    required this.Description,
    required this.Name,
  });
  final String id;
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
          child: Image.network(
            img,
            fit: BoxFit.cover,
            width: 270,
            height: 400,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          Name,
          maxLines: 1,
          style: const TextStyle(
            color: AppColors.BaseColorWhite,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          Description,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(
            color: AppColors.BaseColorWhite,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
