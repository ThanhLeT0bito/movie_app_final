import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';

class item_carousel_signin_signup extends StatelessWidget {
  const item_carousel_signin_signup({
    super.key,
    required this.img,
  });
  final String img;

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
            width: 250,
            height: 300,
          ),
        ),
      ],
    );
  }
}
