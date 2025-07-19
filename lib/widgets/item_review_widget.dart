import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app_final/widgets/Base/custom_bottom_sheet.dart';

import '../resources/app_color.dart';

class ItemReviewWidget extends StatefulWidget {
  const ItemReviewWidget({
    Key? key,
    required this.img,
    required this.name,
    required this.title,
    required this.time,
    required this.star,
  }) : super(key: key);

  final String img;
  final String name;
  final String title;
  final String time;
  final String star;

  @override
  _ItemReviewWidgetState createState() => _ItemReviewWidgetState();
}

class _ItemReviewWidgetState extends State<ItemReviewWidget> {
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return CustomBottomSheetReview(
            img: "assets/images/cat.jpg",
            name: "Angelia",
            time: "12 second",
            title: "Nice movie",
            onButtonPressed: () {},
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Review',
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 220,
            ),
            InkWell(
              onTap: () {
                showBottomSheet(context);
              },
              child: Row(
                children: [
                  Text(
                    'See All',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 14,
                      color:
                          AppColors.BaseColorMain, // Thay đổi màu theo nhu cầu
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: AppColors.BaseColorMain, // Thay đổi màu theo nhu cầu
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Container(
          width: screenWidth,
          height: 110,
          decoration: BoxDecoration(
            color: AppColors.BaseColorBlack,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  width: 75,
                  height: 75,
                  child: Image.asset(
                    widget.img,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          widget.time,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: AppColors.BaseColorMain,
                        ),
                        Icon(
                          Icons.star,
                          color: AppColors.BaseColorMain,
                        ),
                        Icon(
                          Icons.star,
                          color: AppColors.BaseColorMain,
                        ),
                        Icon(
                          Icons.star,
                          color: AppColors.BaseColorMain,
                        ),
                        Icon(
                          Icons.star,
                          color: AppColors.BaseColorMain,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.8),
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
