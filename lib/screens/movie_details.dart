import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';
import 'package:movie_app_final/widgets/Base/custom_text_button.dart';

class MoviedetailsScreens extends StatelessWidget {
  const MoviedetailsScreens({Key? key}) : super(key: key);
  static const routeName = '/movie-details-screen';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        "assets/img_3.jpg",
                        width: double.infinity,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  const SizedBox(height: 150),
                  MainContent(screenWidth: screenWidth),
                ],
              ),
              Positioned(
                  top: 250,
                  left: 0,
                  right: 0,
                  child: Align(
                      alignment: Alignment.center,
                      child: PositionedItem(screenWidth: screenWidth)))
            ],
          ),
        ),
        const Positioned(
          top: 0,
          left: 10,
          right: 0,
          child: CustomAppBar(),
        ),
      ],
    );
  }
}

class PositionedItem extends StatelessWidget {
  const PositionedItem({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: screenWidth - 40,
      height: 200,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.BaseColorAroundBlack,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Mai",
            style: TextStyle(
                fontSize: 25,
                color: AppColors.BaseColorWhite,
                fontWeight: FontWeight.bold),
          ),
          const Text(
            "2h11m* 10.02.2024",
            style:
                TextStyle(color: AppColors.BaseColorAroundWhite, fontSize: 15),
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Text(
                'Review',
                style: TextStyle(
                  color: AppColors.BaseColorWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Icon(
                Iconsax.star5,
                color: AppColors.BaseColorMain,
              ),
              Text(
                "4.8 (1.222)",
                style: TextStyle(color: AppColors.BaseColorWhite, fontSize: 17),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 30,
                    color: AppColors.BaseColorMain,
                  ),
                  Icon(
                    Icons.star,
                    size: 30,
                    color: AppColors.BaseColorMain,
                  ),
                  Icon(
                    Icons.star,
                    size: 30,
                    color: AppColors.BaseColorMain,
                  ),
                  Icon(
                    Icons.star,
                    size: 30,
                    color: AppColors.BaseColorMain,
                  ),
                  Icon(
                    Icons.star,
                    size: 30,
                    color: Colors.grey,
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppColors.BaseColorWhite)),
                padding: const EdgeInsets.all(10),
                child: const Row(
                  children: [
                    Icon(
                      Icons.play_circle,
                      size: 20,
                      color: AppColors.BaseColorMain,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Watch Trailer",
                      style: TextStyle(
                          color: AppColors.BaseColorWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Movie Title',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.0),
            const Text(
              'Release Date: September 30, 2022',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.0),
            const Text(
              'Overview:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.0),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ), // Fill the remaining space
            CustomTextButton(text: "Continue", onPressed: () {})
          ],
        ),
      ),
    );
  }
}
