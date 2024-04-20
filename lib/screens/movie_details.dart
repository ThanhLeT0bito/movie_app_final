import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/screens/select_seat_screen.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';
import 'package:movie_app_final/widgets/Base/custom_text_button.dart';

import '../widgets/Base/custom_cinema_movie_detail.dart';

class MoviedetailsScreens extends StatelessWidget {
  const MoviedetailsScreens({Key? key}) : super(key: key);
  static const routeName = '/movie-details-screen';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
 

    return Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    Image.asset(
                      "assets/images/img_3.jpg",
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 150),
                    MainContent(screenWidth: screenWidth),
                  ],
                ),
                Positioned(
                    top: 230,
                    left: 10,
                    right: 10,
                    child: PositionedItem(screenWidth: screenWidth))
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
      ),
    );
  }
}

class PositionedItem extends StatelessWidget {
  const PositionedItem({
    Key? key,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: screenWidth - 40,
      height: 220,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.BaseColorAroundBlack,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Mai",
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 25,
                color: AppColors.BaseColorWhite,
                fontWeight: FontWeight.bold),
          ),
          const Text(
            "2h11m* 10.02.2024",
            style: TextStyle(
                color: AppColors.BaseColorAroundWhite,
                fontSize: 15,
                decoration: TextDecoration.none),
          ),
          const SizedBox(height: 30),
          const Row(
            children: [
              Text(
                'Review',
                style: TextStyle(
                  decoration: TextDecoration.none,
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
                style: TextStyle(
                    color: AppColors.BaseColorWhite,
                    fontSize: 17,
                    decoration: TextDecoration.none),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
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
                          decoration: TextDecoration.none,
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
    Key? key, // Thay đổi đây
    required this.screenWidth,
  }) : super(key: key); // Thay đổi đây

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Movie genre:',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Romance, psychology', // Chữ thêm vào
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Censorship:',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '18+',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Language:',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Vietnamese',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Storyline',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '"Mai" is the story of Mai, a masseuse with a special fate. She often faces criticism from society and her meeting with Duong - a flower boy, awakens in her a desire for a new life...',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.normal,
                        ),
                        softWrap: true,
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                          height: 5), // Khoảng cách giữa nội dung và "See more"
                      Text(
                        'See more',
                        style: TextStyle(
                          color: AppColors.BaseColorTextMain,
                          fontSize: 16,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Director',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: 200,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  100), // Bo tròn hình ảnh theo đường viền của Container
                              child: Container(
                                width:
                                    50, // Đặt kích thước của hình ảnh tại đây
                                height:
                                    50, // Đặt kích thước của hình ảnh tại đây
                                child: Image.asset(
                                  'assets/images/tran-thanh.jpg',
                                  fit: BoxFit.cover,
                                ), // Thay đổi đường dẫn hình ảnh tại đây
                              ),
                            ),
                            const SizedBox(
                                width:
                                    10), // Khoảng cách giữa hình ảnh và văn bản
                            const Align(
                              alignment: Alignment.center,
                              child: Text('Trấn Thành',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.normal,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Actor',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                constraints: const BoxConstraints(
                                    maxWidth: 200, maxHeight: 70),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade900,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        child: Image.asset(
                                          'assets/images/robert.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Robert Downey Jr.',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          softWrap: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              Container(
                                constraints: const BoxConstraints(
                                    maxWidth: 200, maxHeight: 70),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade900,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        child: Image.asset(
                                          'assets/images/chiris.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Chris Hemsworth',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          softWrap: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              Container(
                                constraints: const BoxConstraints(
                                    maxWidth: 200, maxHeight: 70),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade900,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        child: Image.asset(
                                          'assets/images/evans.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Chris Evans',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          softWrap: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                  const SizedBox(
                    height: 20,
                  ),
                     ChooseCinema(),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextButton(
                          text: 'Continue',
                          onPressed: () {
                            Navigator.pushNamed(
                                context, SelectSeatScreen.routeName);
                          }),
                    ],
                  ),
                ),
          ),        
      ],
    );
  }
}
