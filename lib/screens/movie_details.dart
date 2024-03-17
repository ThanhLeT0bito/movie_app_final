import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';

class MoviedetailsScreens extends StatefulWidget {
  const MoviedetailsScreens({Key? key}) : super(key: key);
  static const routeName = '/movie-details-screen';

  @override
  State<MoviedetailsScreens> createState() => _MoviedetailsScreensState();
}

class _MoviedetailsScreensState extends State<MoviedetailsScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      body: CustomScrollView(
        slivers: [
          // Background Image with SliverAppBar
          SliverAppBar(
            floating: true,
  scrolledUnderElevation: 5,
  expandedHeight: 300.0,
  flexibleSpace: FlexibleSpaceBar(
    background: Image.asset(
      'assets/img_3.jpg',
      fit: BoxFit.cover,
    ),
  ),
),
SliverPadding(
  padding: EdgeInsets.only(),
  sliver: SliverList(
    delegate: SliverChildListDelegate(
      [
        SizedBox(
          height: 300, // Đảm bảo rằng các phần tử trong Stack có kích thước được cung cấp
          child: Stack(
            children: [
              Positioned(
                left: 70,
                right: 70,
                child: Container(
                  height: 150,
                  color: Colors.grey.withOpacity(0.5), 
                ),
              ),
              // Thêm các phần tử con khác của Stack ở đây
            ],
          ),
        ),
        ],
      ),
  ),
          ),],),
    );
  }
}
