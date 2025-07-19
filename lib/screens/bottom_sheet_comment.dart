import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:movie_app_final/models/review_model.dart';
import 'package:movie_app_final/providers/AuthProvider.dart';
import 'package:movie_app_final/providers/review_provider.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/resources/converter.dart';
import 'package:movie_app_final/screens/watching_movie_detail.dart';
import 'package:provider/provider.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    Key? key,
    required this.movieId,
  }) : super(key: key);
  final String movieId;

  @override
  Widget build(BuildContext context) {
    final reviewData = Provider.of<ReviewProvider>(context);
    final firstReview = reviewData.firstReview;
    if (firstReview == null) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            Center(
              child: Text(
                "EMPTY!",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      );
    }

    final dataAuth = Provider.of<AuthProvider>(context);
    final user =
        dataAuth.users.firstWhereOrNull((e) => e.id == firstReview.userId);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Review',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.BaseColorWhite,
                ),
              ),
              const Text(
                'See All',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.BaseColorTextMain,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Row(
            children: [
              ClipOval(
                child: (user?.urlImage == null ||
                        !File(user!.urlImage!).existsSync())
                    ? Image.asset(
                        'assets/images/avatar.jpg',
                        width: 78.0,
                        height: 78.0,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        File(user.urlImage!),
                        width: 78.0,
                        height: 78.0,
                        fit: BoxFit.cover,
                      ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          user?.name ?? '',
                          style: const TextStyle(
                            color: AppColors.BaseColorWhite,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ConverterGloabal.ConvertDateTimeToString(
                              firstReview.createdAt ?? DateTime.now()),
                          style: const TextStyle(
                            color: AppColors.BaseColorWhite,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        firstReview.comment,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.BaseColorWhite,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Row(
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
          )
        ],
      ),
    );
  }
}
