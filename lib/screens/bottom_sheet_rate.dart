import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:movie_app_final/models/review_model.dart';
import 'package:movie_app_final/providers/AuthProvider.dart';
import 'package:movie_app_final/providers/review_provider.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/screens/watching_movie_detail.dart';
import 'package:provider/provider.dart';

class RateMovieWidget extends StatefulWidget {
  const RateMovieWidget({
    Key? key,
    required this.movieId,
  }) : super(key: key);
  final String movieId;

  @override
  State<RateMovieWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<RateMovieWidget> {
  late ReviewModel? firstReview;
  // @override
  // void initState() {
  //   final reviewData = Provider.of<ReviewProvider>(context);
  //   firstReview = reviewData.reviewsOfMovie.firstOrNull;
  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    final reviewData = Provider.of<ReviewProvider>(context);
    firstReview = reviewData.reviewsOfMovie.firstOrNull;
    //firstReview = reviewData.firstReview;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final reviewData = Provider.of<ReviewProvider>(context);
    firstReview = reviewData.firstReview;
    if (firstReview == null) {
      return const Column(
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
          //Center(child: CircularProgressIndicator()),
          Center(
            child: Text(
              "EMPTY!",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      );
    }

    final dataAuth = Provider.of<AuthProvider>(context);
    final user =
        dataAuth.users.firstWhereOrNull((e) => e.id == firstReview!.userId);

    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Review',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.BaseColorWhite,
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    ClipOval(
                        child:
                            //user!.urlImage == null ?
                            Image.asset(
                      'assets/images/avatar.jpg',
                      width: 78.0,
                      height: 78.0,
                      fit: BoxFit.cover,
                    )
                        // : Image.network(
                        //     user.urlImage.toString(),
                        //     width: 78.0,
                        //     height: 78.0,
                        //     fit: BoxFit.cover,
                        //   ),
                        ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 120,
                      child: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  user!.name,
                                  style: const TextStyle(
                                    color: AppColors.BaseColorWhite,
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
                                firstReview!.comment,
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
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
