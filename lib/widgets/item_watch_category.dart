import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';

class ItemWatchCategory extends StatelessWidget {
  const ItemWatchCategory({
    Key? key,
   // required this.title,
    required this.image,
  }) : super(key: key);

 // final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 150,
            height: 100,
            decoration: BoxDecoration(
              //shape: BoxShape.circle,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 150,
              height: 100,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              color: Colors.black.withOpacity(0.5),
              // child: Stack(
              //   alignment: Alignment.center,
              //   children: [
              //     Text(
              //       title,
              //       maxLines: 1,
              //       textAlign: TextAlign.center,
              //       style: const TextStyle(
              //         color: AppColors.BaseColorWhite,
              //         fontSize: 18,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ],
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
