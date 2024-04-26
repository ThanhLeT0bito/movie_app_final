import 'package:flutter/material.dart';
import 'package:movie_app_final/providers/manager_all_widget.dart';
import 'package:movie_app_final/providers/movie_providers.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/screens/home_page_screens.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';
import 'package:movie_app_final/widgets/Base/custom_item_category_widget.dart';
import 'package:movie_app_final/widgets/Base/custom_watch_category_hp.dart';
import 'package:movie_app_final/widgets/carousel_widget.dart';
import 'package:movie_app_final/widgets/item_carousel_widget.dart';
import 'package:movie_app_final/widgets/item_movie_cs_hp.dart';
import 'package:movie_app_final/widgets/item_movie_title.dart';
import 'package:movie_app_final/widgets/item_watch_category.dart';
import 'package:movie_app_final/widgets/search_widget.dart';
import 'package:provider/provider.dart';

class HomeWatching extends StatefulWidget {
  const HomeWatching({Key? key}) : super(key: key);
  static const routeName = '/home-watching';

  @override
  State<HomeWatching> createState() => _HomeWatchingState();
}

class _HomeWatchingState extends State<HomeWatching> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ManagerAllWidget>(context);
    var dataMovie = Provider.of<Movieproviders>(context);
    List<ItemCarouselWidget> listCarousel = dataMovie.listCarousel;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CustomAppBar(
            iconLeftButton: Icons.change_circle_sharp,
            iconRightButton: Icons.notifications,
            title: "Welcome Back",
            onPressedBack: () {
              data.ShowBottomSheetMode(context);
            },
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
                    Container(
                      height: MediaQuery.of(context).size.height *
                          0.6, // Đặt chiều cao cố định cho Container
                      child: CarouselWidget(
                        listCarousel: listCarousel,
                      ), // Bọc CarouselWidget65rong Container
                    ),
                    itemcaterogy_watch(
                      title: "Category",
                      navogatorName: "/category-list",
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ItemWatchCategory(
                            title: 'Action',
                            image: "assets/images/category_1.png",
                          ),
                          ItemWatchCategory(
                            title: 'Adventure',
                            image: "assets/images/category_2.png",
                          ),
                          ItemWatchCategory(
                            title: 'Comedy',
                            image: "assets/images/category_3.png",
                          ),
                        ],
                      ),
                    ),
                    ItemCategoryWidget(
                      title: "Coming soon",
                      navogatorName: "CategoryScreens()",
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ItemMovieWithTitle(
                            img: "assets/images/me4.png",
                            title: "The Godzila Avenger Game.",
                            isShowTitle: false,
                          ),
                          ItemMovieWithTitle(
                            img: "assets/images/doraemon.jpg",
                            title: "Avenger Game.",
                            isShowTitle: false,
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
                            img: "assets/images/t4.png",
                            title: "The Godzila Avenger Game.",
                            isShowTitle: false,
                            isWatching: true,
                          ),
                          ItemMovieWithTitle(
                            img: "assets/images/ngan.png",
                            title: "Avenger Game.",
                            isShowTitle: false,
                            isWatching: true,
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
                            img: "assets/images/panda.png",
                            title: "The Godzila Avenger Game.",
                            isShowTitle: false,
                          ),
                          ItemMovieWithTitle(
                            img: "assets/images/spy.png",
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
                            img: "assets/images/spy.png",
                            title: "The Godzila Avenger Game.",
                            isShowTitle: false,
                          ),
                          ItemMovieWithTitle(
                            img: "assets/images/insite_out.png",
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
                            img: "assets/images/img_3.jpg",
                            title: "The Godzila Avenger Game.",
                            isShowTitle: false,
                          ),
                          ItemMovieWithTitle(
                            img: "assets/images/img_1.jpg",
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
                            img: "assets/images/avengers.png",
                            title: "The Godzila Avenger Game.",
                            isShowTitle: false,
                          ),
                          ItemMovieWithTitle(
                            img: "assets/images/adventure_2.png",
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
    );
  }
}
