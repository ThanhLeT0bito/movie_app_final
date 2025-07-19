import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_final/models/review_model.dart';
import 'package:movie_app_final/providers/AuthProvider.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/resources/converter.dart';
import 'package:provider/provider.dart';

class ItemDetailReview extends StatelessWidget {
  const ItemDetailReview({
    super.key,
    required this.review,
  });

  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    print(review.createdAt.toString());
    final dataAuth = Provider.of<AuthProvider>(context);
    final user = dataAuth.users.firstWhereOrNull((e) => e.id == review.userId);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child:
                (user?.urlImage == null || !File(user!.urlImage!).existsSync())
                    ? Image.asset(
                        'assets/images/avatar.jpg',
                        width: 70.0,
                        height: 70.0,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        File(user.urlImage!),
                        width: 70.0,
                        height: 70.0,
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
                      user!.name,
                      style: const TextStyle(
                        color: AppColors.BaseColorMain,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ConverterGloabal.ConvertDateTimeToString(
                          review.createdAt!),
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
