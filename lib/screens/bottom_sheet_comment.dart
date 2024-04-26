import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';

class CommentWidget extends StatelessWidget {
  final String imagePath;
  final String name;
  final String time;
  final String comment;

  const CommentWidget({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.time,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Review',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.BaseColorWhite,
                ),
              ),
              SizedBox(height: 20.0),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 25.0,
                    height: 25.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: AppColors.BaseColorWhite, width: 2.0),
                    ),
                  ),
                  ClipOval(
                    child: Image.asset(
                      imagePath,
                      width: 78.0,
                      height: 78.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: 4),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: AppColors.BaseColorWhite,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      color: AppColors.BaseColorWhite,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.0),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  comment,
                  style: TextStyle(
                    color: AppColors.BaseColorWhite,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Text(
                    'Love',
                    style: TextStyle(
                      color: AppColors.BaseColorGrey,
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Text(
                    'Comment',
                    style: TextStyle(
                      color: AppColors.BaseColorGrey,
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ClipOval(
                          child: Icon(
                            Icons.favorite_border,
                            color: AppColors.BaseColorWhite,
                            size: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );

  }

}
