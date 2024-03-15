import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';

import '../widgets/Base/custom_bottom_navigator.dart';

class HomeOrderMovie extends StatefulWidget {
  const HomeOrderMovie({super.key});
  static const routeName = '/home-order-movie';

  @override
  State<HomeOrderMovie> createState() => _HomeOrderMovieState();
}

class _HomeOrderMovieState extends State<HomeOrderMovie> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      body: Column(
        children: [
          CustomAppBar(
            title: "Home Order",
          ),
          Expanded(
            child: Center(
              child: Text('Hello'),
            ),
          ),
          CustomBottomNavigator(ticketLabel: "Ticket", movieLabel: "Movie", iconTicket: Iconsax.ticket, iconVideo: Iconsax.video, iconTicketSelected: Iconsax.ticket5, iconVideoSelected: Iconsax.video4,),
        ],
      ),
    );
  }
}
