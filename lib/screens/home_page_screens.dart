import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_app_final/models/model_widget/item_radio.dart';
import 'package:movie_app_final/providers/manager_all_widget.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/widgets/Base/custom_bottom_sheet.dart';
import 'package:movie_app_final/widgets/Base/custom_item_category_widget.dart';
import 'package:movie_app_final/widgets/Base/custom_item_radio.dart';
import 'package:movie_app_final/widgets/carousel_widget.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';
import 'package:movie_app_final/widgets/item_movie_cs_hp.dart';
import 'package:movie_app_final/widgets/item_movie_title.dart';
import 'package:movie_app_final/widgets/item_service_widget.dart';
import 'package:movie_app_final/widgets/search_widget.dart';
import 'package:provider/provider.dart';

class HomepageScreens extends StatelessWidget {
  const HomepageScreens({Key? key}) : super(key: key);
  static const routeName = '/home-page';

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ManagerAllWidget>(context);
    List<ItemRadio> listItemCustom = [
      ItemRadio(
          isSelected: true,
          text: "Booking Ticket",
          img: "assets/images/booking.png"),
      ItemRadio(
          isSelected: false,
          text: "Watching Movie",
          img: "assets/images/watching.png"),
    ];

    late bool isFirst;

    void showBottomSheet() {}

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CustomAppBar(
            onPressedBack: () {
              data.ShowBottomSheetMode(context);
            },
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
                          ItemMovieWidget(
                            img: 'assets/images/doraemon.jpg',
                            name: 'Avatar 2: The Way Of Water',
                            title: 'Adventure, Sci-fi',
                            time: '20.12.2022',
                          ),
                          ItemMovieWidget(
                            img: 'assets/images/spy.png',
                            name: 'Ant Man Wasp: Quantumania',
                            title: 'Adventure, Sci-fi',
                            time: '25.12.2022',
                          ),
                          ItemMovieWidget(
                            img: 'assets/images/fox.png',
                            name: 'Fox puss in Boots: The last Wish',
                            title: 'Adventure, Sci-fi',
                            time: '27.12.2022',
                          ),
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
                          "assets/images/promo.png",
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
                          title:
                              "When The Batman 2 Starts Filming Reportedly Revealed",
                        ),
                        ItemMovieWithTitle(
                          img: "assets/images/doraemon_movienew.png",
                          title:
                              "6 Epic Hulk Fights That Can Happen In The MCU's Future.",
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
    );
  }
}
