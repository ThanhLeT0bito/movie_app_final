import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselBanner extends StatelessWidget {
  const CustomCarouselBanner ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        items: [1, 2, 3, 4]. map((i) {
          return Container(
            width: 20,
          );
        }).toList(),
        options: CarouselOptions(height: 300,),
      ),
    );
  }
}
