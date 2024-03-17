import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/screens/home_page_screens.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';
import 'package:movie_app_final/widgets/Base/custom_item_category_widget.dart';
import 'package:movie_app_final/widgets/Base/custom_watch_category_hp.dart';
import 'package:movie_app_final/widgets/carousel_widget.dart';
import 'package:movie_app_final/widgets/item_movie_cs_hp.dart';
import 'package:movie_app_final/widgets/item_movie_title.dart';
import 'package:movie_app_final/widgets/item_watch_category.dart';
import 'package:movie_app_final/widgets/search_widget.dart';

class HomeWatching extends StatefulWidget {
  const HomeWatching({Key? key}) : super(key: key);
  static const routeName = '/home-watching';

  @override
  State<HomeWatching> createState() => _HomeWatchingState();
}

class _HomeWatchingState extends State<HomeWatching> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            CustomAppBar(
              iconLeftButton: Icons.change_circle_sharp,
              iconRightButton: Icons.notifications,
              title: "Welcome Back",
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 10),
                      SearchWidget(),
                      SizedBox(height: 20),
                      //carousel
                      CarouselWidget(),
                      itemcaterogy_watch(
                        title: "Category",
                        navogatorName: "",
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ItemWatchCategory(
                              title: 'Action',
                              image: "assets/images/godzila.png",
                            ),
                            ItemWatchCategory(
                              title: 'Adventure',
                              image: "assets/images/godzila.png",
                            ),
                            ItemWatchCategory(
                              title: 'Comedy',
                              image: "assets/images/godzila.png",
                            ),
                            ItemWatchCategory(
                              title: 'Vietname',
                              image: "assets/images/godzila.png",
                            ),
                            ItemWatchCategory(
                              title: 'Popular',
                              image: "assets/images/godzila.png",
                            ),
                          ],
                        ),
                      ),
                      ItemCategoryWidget(
                        title: "Continue movie",
                        navogatorName: "",
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ItemMovieWithTitle(
                              img: "assets/images/godzila.png",
                              title: "The Godzila Avenger Game.",
                              isShowTitle: false,
                            ),
                            ItemMovieWithTitle(
                              img: "assets/images/godzila.png",
                              title: "Avenger Game.",
                              isShowTitle: false,
                            ),
                          ],
                        ),
                      ),
                      ItemCategoryWidget(
                        title: "Popular movie",
                        navogatorName: "",
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ItemMovieWithTitle(
                              img: "assets/images/godzila.png",
                              title: "The Godzila Avenger Game.",
                              isShowTitle: false,
                            ),
                            ItemMovieWithTitle(
                              img: "assets/images/godzila.png",
                              title: "Avenger Game.",
                              isShowTitle: false,
                            ),
                          ],
                        ),
                      ),
                      ItemCategoryWidget(
                        title: "Comedy movie",
                        navogatorName: "",
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ItemMovieWithTitle(
                              img: "assets/images/godzila.png",
                              title: "The Godzila Avenger Game.",
                              isShowTitle: false,
                            ),
                            ItemMovieWithTitle(
                              img: "assets/images/godzila.png",
                              title: "Avenger Game.",
                              isShowTitle: false,
                            ),
                          ],
                        ),
                      ),
                      ItemCategoryWidget(
                        title: "Vietnam movie",
                        navogatorName: "",
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ItemMovieWithTitle(
                              img: "assets/images/godzila.png",
                              title: "The Godzila Avenger Game.",
                              isShowTitle: false,
                            ),
                            ItemMovieWithTitle(
                              img: "assets/images/godzila.png",
                              title: "Avenger Game.",
                              isShowTitle: false,
                            ),
                          ],
                        ),
                      ),
                      ItemCategoryWidget(
                        title: "Adventure movie",
                        navogatorName: "",
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ItemMovieWithTitle(
                              img: "assets/images/godzila.png",
                              title: "The Godzila Avenger Game.",
                              isShowTitle: false,
                            ),
                            ItemMovieWithTitle(
                              img: "assets/images/godzila.png",
                              title: "Avenger Game.",
                              isShowTitle: false,
                            ),
                          ],
                        ),
                      ),
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
