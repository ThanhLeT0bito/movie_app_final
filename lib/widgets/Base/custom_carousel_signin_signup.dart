import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_final/widgets/item_carousel_signin_signup.dart';
import 'package:movie_app_final/widgets/item_carousel_widget.dart';

class carousel_signin_signup extends StatelessWidget {
  const carousel_signin_signup({super.key});

  @override
  Widget build(BuildContext context) {
    late List<Widget> listCarousel = [
      const item_carousel_signin_signup(
        img: "assets/images/img_3.jpg",
      ),
      const item_carousel_signin_signup(
        img: "assets/images/img_1.jpg",
      ),
      const item_carousel_signin_signup(
        img: "assets/images/img_3.jpg",
      ),
      const item_carousel_signin_signup(
        img: "assets/images/img_1.jpg",
      ),
    ];
    return CarouselSlider(
      options: CarouselOptions(
        height: null,
        aspectRatio: 14 / 12,
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
