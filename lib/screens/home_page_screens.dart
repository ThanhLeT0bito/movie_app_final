import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/widgets/Base/custom_item_category_widget.dart';
import 'package:movie_app_final/widgets/carousel_widget.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';
import 'package:movie_app_final/widgets/item_movie_cs_hp.dart';
import 'package:movie_app_final/widgets/item_service_widget.dart';
import 'package:movie_app_final/widgets/search_widget.dart';

class HomepageScreens extends StatefulWidget {
  const HomepageScreens({Key? key}) : super(key: key);
  static const routeName = '/home-page';

  @override
  State<HomepageScreens> createState() => _HomepageScreensState();
}

class _HomepageScreensState extends State<HomepageScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const CustomAppBar(
              iconLeftButton: Icons.change_circle_sharp,
              iconRightButton: Icons.notifications,
              title: "Welcome Back",
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 10),
                      const SearchWidget(),
                      const SizedBox(height: 20),
                      const ItemCategoryWidget(
                        title: "Now playing",
                        navogatorName: "",
                      ),
                      const SizedBox(height: 20),
                      //carousel
                      const CarouselWidget(),
                      const ItemCategoryWidget(
                        title: "Comming Soon",
                        navogatorName: "",
                      ),
                      //item comming soon
                      const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ItemMovieWidget(),
                            ItemMovieWidget(),
                            ItemMovieWidget(),
                            ItemMovieWidget(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const ItemCategoryWidget(
                        title: "Promo & Discount",
                        navogatorName: "",
                      ),
                      Stack(
                        children: [
                          Image.asset(
                            "assets/promo.png",
                            height: 250,
                          ),
                          const Positioned(
                              top: 50,
                              right: 20,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "30%",
                                        style: TextStyle(
                                          color: AppColors.BaseColorWhite,
                                          fontSize: 55,
                                        ),
                                      ),
                                      Text(
                                        "OFF",
                                        style: TextStyle(
                                            color: AppColors.BaseColorTextMain,
                                            fontSize: 45,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Text(
                                    "Movie voucher free",
                                    style: TextStyle(
                                        color: AppColors.BaseColorWhite,
                                        fontSize: 17),
                                  ),
                                ],
                              ))
                        ],
                      ),

                      const SizedBox(height: 10),
                      const ItemCategoryWidget(
                        title: "Service",
                        navogatorName: "",
                      ),
                      const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ItemServiceWidget(
                              img: "assets/images/rental.png",
                              title: "Rental",
                            ),
                            ItemServiceWidget(
                              img: "assets/images/imax.png",
                              title: "Imax",
                            ),
                            ItemServiceWidget(
                              img: "assets/images/4dx.png",
                              title: "4dx",
                            ),
                            ItemServiceWidget(
                              img: "assets/images/double_seat.png",
                              title: "SweatBox",
                            )
                          ],
                        ),
                      ),
                      // movie new
                      const SizedBox(height: 10),
                      const ItemCategoryWidget(
                        title: "Movie News",
                        navogatorName: "",
                      ),
                      const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          ItemMovieWithTitle(
                            img: "assets/images/godzila.png",
                            title: "The Godzila Avenger Game.",
                          ),
                          ItemMovieWithTitle(
                            img: "assets/images/godzila.png",
                            title: "Avenger Game.",
                          ),
                        ]),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemMovieWithTitle extends StatelessWidget {
  const ItemMovieWithTitle({
    super.key,
    required this.img,
    required this.title,
  });
  final String img;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Image.asset(
            img,
            width: 230,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 5),
          Container(
            width: 230,
            padding: const EdgeInsets.all(5),
            child: SizedBox(
              height: 50,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                    color: AppColors.BaseColorTextMain,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
