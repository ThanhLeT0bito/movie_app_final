// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_app_final/models/order_model.dart';
import 'package:movie_app_final/providers/orders_provider.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/screens/home_screen.dart';
import 'package:movie_app_final/screens/rate_screen.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';
import 'dart:math' as math;

import 'package:movie_app_final/widgets/Base/custom_text_button.dart';
import 'package:provider/provider.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  static const String routeName = "/ticket-screen";

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  late String orderId;
  late OrderModel orderModel;
  late MovieModel movieModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchData();
  }

  Future<void> fetchData() async {
    var dataOrder = Provider.of<OrdersProvider>(context, listen: false);
    var arg = ModalRoute.of(context)!.settings.arguments;

    if (arg is String) {
      orderId = arg;
      print("&&&&&&&&&&&&");
      print(orderId);
      if (await dataOrder.fetchOrderById(orderId) != null) {
        orderModel = await dataOrder.fetchOrderById(orderId) as OrderModel;
        print("DATE DATE DATE DATE:");
        print(orderModel.dateMovie);
      }
    } else if (arg is OrderModel) {
      orderModel = arg;
    }
  }

  Future<void> fetchMovieById() async {
    var dataMovie = Provider.of<Movieproviders>(context, listen: false);
    var arg = ModalRoute.of(context)!.settings.arguments;

    String idMovie = orderModel.idMovie;

    if (arg is String) {
      idMovie = arg;
      print("&&&&&&&&&&&&");
      print(idMovie);
      if (await dataMovie.fetchOrderById(idMovie) != null) {
        movieModel = await dataMovie.fetchOrderById(idMovie) as MovieModel;
      }
    } else if (arg is OrderModel) {
      movieModel = arg;
    }
  }


  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          CustomAppBar(
            title: "My Ticket",
            showBackButton: false,
            iconRightButton: Icons.close,
            onPressedRight: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Stack(
            children: [
              Container(
                width: screenWidth - 40,
                height: screenheight * 0.75,
                decoration: BoxDecoration(
                    color: AppColors.BaseColorWhite,
                    borderRadius: BorderRadius.circular(10)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      ImageAndTitleWidget(name: movieModel.name, image: movieModel.thumbnail, time: movieModel.duration, category: movieModel.category),
                      SizedBox(height: 20),
                      TimeAndSeatWidget(),
                      SizedBox(height: 20),
                      Divider(color: AppColors.BaseColorBlack),
                      SizedBox(height: 10),
                      PriceLocationAndNoteWidget(),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: -55,
                bottom: 140,
                child: CustomPaint(
                  size: const Size(50, 50),
                  painter: HalfCirclePainter(isRight: true),
                ),
              ),
              Positioned(
                right: 0,
                left: 0,
                bottom: 165,
                child: CustomPaint(
                  size:
                      const Size(double.infinity, 1), // Kích thước của gạch đứt
                  painter: DashedLinePainter(),
                ),
              ),
              Positioned(
                right: -55,
                bottom: 140,
                child: CustomPaint(
                  size: const Size(50, 50),
                  painter: HalfCirclePainter(isRight: false),
                ),
              ),
              Positioned(
                  left: 20,
                  right: 20,
                  bottom: 15,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/QRcode.png',
                        height: 80,
                        // width: screenWidth - 150,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 10),
                      const Text("OrderId: 723439823")
                    ],
                  ))
            ],
          ),
          const Spacer(),
          CustomTextButton(
              text: "Rate Movie",
              onPressed: () {
                Navigator.pushNamed(context, RateScreen.routeName);
              }),
          const SizedBox(height: 5)
        ]),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black // Màu của gạch đứt
      ..strokeWidth = 1.0 // Độ dày của gạch đứt
      ..style = PaintingStyle.stroke;

    final double dashWidth = 5.0; // Chiều dài của mỗi đoạn gạch
    final double dashSpace = 5.0; // Khoảng cách giữa các đoạn gạch

    double currentX = 0;
    while (currentX < size.width) {
      canvas.drawLine(
        Offset(currentX, 0),
        Offset(currentX + dashWidth, 0),
        paint,
      );
      currentX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class HalfCirclePainter extends CustomPainter {
  final bool isRight;

  HalfCirclePainter({this.isRight = false});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black // Màu của hình tròn
      ..style = PaintingStyle.fill;

    final double radius = size.width / 2;

    final double centerX = isRight ? size.width : 0.0;
    final double centerY = size.height / 2;

    final Rect rect =
        Rect.fromCircle(center: Offset(centerX, centerY), radius: radius);

    if (isRight) {
      canvas.drawArc(
          rect, -math.pi / 2, math.pi, true, paint); // Vẽ nửa bên phải
    } else {
      canvas.drawArc(
          rect, math.pi / 2, math.pi, true, paint); // Vẽ nửa bên trái
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class PriceLocationAndNoteWidget extends StatelessWidget {
  const PriceLocationAndNoteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Icon(
              Iconsax.bitcoin_refresh,
              size: 27,
            ),
            SizedBox(width: 10),
            Text(
              "210.000 VNĐ",
              style: TextStyle(
                  color: AppColors.BaseColorBlack,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Iconsax.location,
              size: 27,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Vincom Ocean Park",
                  style: TextStyle(
                      color: AppColors.BaseColorBlack,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "4th, Vincom ocean Park, Da Ton, HCM",
                  style:
                      TextStyle(fontSize: 15, color: AppColors.BaseColorBlack),
                )
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Iconsax.note,
              size: 27,
            ),
            SizedBox(width: 10),
            SizedBox(
              width: 300,
              child: Text(
                "Show this QR code to the ticket counter to receive your ticket",
                style: TextStyle(
                  color: AppColors.BaseColorBlack,
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class ImageAndTitleWidget extends StatelessWidget {
  const ImageAndTitleWidget({
    super.key,
    required this.name,
    required this.image,
    required this.time,
    required this.category,
  });
  final String name;
  final String image;
  final String time;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            image,
            width: 120,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 15),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              SizedBox(
                width: 170,
                child: Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: AppColors.BaseColorBlack),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Iconsax.timer_1,
                    size: 25,
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: 170,
                    child: Text(
                      time,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15, color: AppColors.BaseColorBlack),
                    ),
                  )
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    Iconsax.video,
                    size: 25,
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    width: 170,
                    child: Text(
                      category,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15, color: AppColors.BaseColorBlack),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class TimeAndSeatWidget extends StatelessWidget {
  const TimeAndSeatWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Icon(
                Iconsax.calendar_1,
                size: 50,
                color: AppColors.BaseColorBlack,
              ),f
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "14h25'",
                    style: TextStyle(
                        fontSize: 15,
                        color: AppColors.BaseColorBlack,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "10.12.2024",
                    style: TextStyle(
                        fontSize: 15,
                        color: AppColors.BaseColorBlack,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Icon(
                Icons.chair_alt,
                size: 50,
                color: AppColors.BaseColorBlack,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Section 4",
                    style: TextStyle(
                        fontSize: 15,
                        color: AppColors.BaseColorBlack,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Seat H4,H5",
                    style: TextStyle(
                        fontSize: 15,
                        color: AppColors.BaseColorBlack,
                        fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
