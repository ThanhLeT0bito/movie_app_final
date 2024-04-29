import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';

class ItemCarouselWidget extends StatelessWidget {
  const ItemCarouselWidget({
    Key? key,
    required this.id,
    required this.img,
    required this.description,
    required this.name,
    this.star = 4,
    this.view = 1878,
  }) : super(key: key);
  final String id;
  final String img;
  final String description;
  final String name;
  final int? star;
  final double? view;
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
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: AppColors.BaseColorWhite,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  textAlign: TextAlign.center,
                  description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    color: AppColors.BaseColorWhite,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (star! > 0)
              Icon(
                Icons.star,
                color: AppColors.BaseColorMain,
              ),
            SizedBox(
                width:
                    5), // Adjust the spacing between the star icon and the text
            Text(
              '$star',
              style: TextStyle(
                color: AppColors.BaseColorWhite,
                fontSize: 16,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              '(${view!})',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
