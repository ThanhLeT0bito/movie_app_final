import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/widgets/item_carousel_widget.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    late List<Widget> listCarousel = [
      const ItemCarouselWidget(
        img: "assets/images/img_3.jpg",
        Name: "Mai",
        Description: "2h11m. Roman, psychology",
      ),
      const ItemCarouselWidget(
        img: "assets/images/img_1.jpg",
        Name: "Đào Phở, Piano",
        Description: "2h11m. Roman, psychology, History, Hero",
      ),
      const ItemCarouselWidget(
        img: "assets/images/img_3.jpg",
        Name: "Mai",
        Description: "2h11m. Roman, psychology,..",
      ),
      const ItemCarouselWidget(
        img: "assets/images/img_1.jpg",
        Name: "Đào Phở, Piano",
        Description: "2h11m. Roman, psychology, History, Hero",
      ),
    ];
    return CarouselSlider(
      options: CarouselOptions(
        height: null,
        aspectRatio: 9 / 12,
        autoPlay: true, // Tự động lướt
        autoPlayInterval: const Duration(seconds: 4), // Thời gian mỗi lượt lướt
        autoPlayAnimationDuration: const Duration(
            milliseconds: 100), // Thời gian chuyển đổi giữa các lượt lướt
        autoPlayCurve:
            Curves.fastOutSlowIn, // Đường cong chuyển động của lướt tự động
        //enlargeCenterPage: true,
        //viewportFraction: 0.6,
      ),
      items: listCarousel.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return item;
          },
        );
      }).toList(),
    );
  }
}
