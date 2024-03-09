import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/resources/dimens.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';

class TicketMovieScreens extends StatefulWidget {
  const TicketMovieScreens({Key? key}) : super(key: key);
  static const routeName = '/home-ticket-movie';

  @override
  State<TicketMovieScreens> createState() => _TicketMovieScreensState();
}

class _TicketMovieScreensState extends State<TicketMovieScreens> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.BaseColorBlackGround,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomAppBar(title: 'My ticket',),
            Expanded(
              child: ListView(
                children: [
                  productItem(
                    movieName: 'Mai',
                    dateTime: '14h15 . 16.12.2022',
                    theaterLocation: 'Vincom Ocean Park CGV',
                    image: 'assets/img_3.jpg', // Đường dẫn tới hình ảnh
                  ),
                  productItem(
                    movieName: 'Gặp lại chị bầu',
                    dateTime: '2h15 . 22.12.2022',
                    theaterLocation: 'Vincom Ocean Park CGV',
                    image: 'assets/img_2.jpg', // Đường dẫn tới hình ảnh
                  ),
                  productItem(
                    movieName:'Phở, đào và piano',
                    dateTime: '14h15 . 29.12.2022',
                    theaterLocation: 'Vincom Ocean Park CGV',
                    image: 'assets/img_1.jpg', // Đường dẫn tới hình ảnh
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget productItem({
    required String movieName,
    required String dateTime,
    required String theaterLocation,
    required String image,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.Background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 150,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.BaseColorTextMain,
                    ),
                  ),
                  const SizedBox(height: 10),
                   Row(
                    children: [
                      const Icon(Icons.access_time,color: AppColors.BaseColorWhite,),
                      const SizedBox(width: 10),
                      Text(
                        '$dateTime',
                        style: const TextStyle(fontSize: 16, color:AppColors.BaseColorWhite),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.location_city, color: AppColors.BaseColorWhite,),
                      const SizedBox(width: 10),
                      Text(
                        '$theaterLocation',
                        style: const TextStyle(fontSize: 16, 
                        color: AppColors.BaseColorWhite),
                  ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
