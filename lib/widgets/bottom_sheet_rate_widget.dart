import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_final/models/data_local/UserPreferences%20.dart';
import 'package:movie_app_final/models/review_model.dart';
import 'package:movie_app_final/providers/AuthProvider.dart';
import 'package:movie_app_final/providers/review_provider.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:provider/provider.dart';

class BottomSheetRateMovie extends StatefulWidget {
  const BottomSheetRateMovie({
    super.key,
    required this.movieId,
  });
  final String movieId;

  @override
  State<BottomSheetRateMovie> createState() => _BottomSheetRateMovieState();
}

class _BottomSheetRateMovieState extends State<BottomSheetRateMovie> {
  late List<ReviewModel> reviews = [];

  @override
  Widget build(BuildContext context) {
    final reviewData = Provider.of<ReviewProvider>(context);
    reviews = reviewData.reviewsOfMovie;
    final dataAuth = Provider.of<AuthProvider>(context);
    final user = dataAuth.CurrentUser;
    return Container(
      color: Colors.black,
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 6,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: AppColors.BaseColorMain,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Rates',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25,
                color: AppColors.BaseColorWhite,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          reviews.isEmpty
              ? const Expanded(
                  child: Center(
                    child: Text(
                      "EMPTY",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                      itemCount: reviews.length,
                      itemBuilder: (context, index) {
                        return ItemDetailRate(
                          review: reviews[index],
                        );
                      }),
                ),
        ],
      ),
    );
  }
}

class ItemDetailRate extends StatelessWidget {
  const ItemDetailRate({
    super.key,
    required this.review,
  });

  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    final dataAuth = Provider.of<AuthProvider>(context);
    final user = dataAuth.users.firstWhereOrNull((e) => e.id == review.userId);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
              child:
                  //user!.urlImage == null?
                  Image.asset(
            'assets/images/avatar.jpg',
            width: 78.0,
            height: 78.0,
            fit: BoxFit.cover,
          )
              // : Image.file(
              //     File(user.urlImage!),
              //     width: 78.0,
              //     height: 78.0,
              //     fit: BoxFit.cover,
              //   ),
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
                      user!.name,
                      style: const TextStyle(
                        color: AppColors.BaseColorMain,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      '12 seconds',
                      style: TextStyle(
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
                    review.comment,
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
      ),
    );
  }
}
