import 'package:flutter/material.dart';
import 'package:movie_app_final/models/Nowplaying.dart';
import 'package:movie_app_final/models/movie_model.dart';
import 'package:movie_app_final/providers/manager_all_widget.dart';
import 'package:movie_app_final/providers/review_provider.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/resources/dimens.dart';
import 'package:movie_app_final/screens/movie_details.dart';
import 'package:movie_app_final/screens/watching_movie_detail.dart';
import 'package:provider/provider.dart';

class NowplayingItems extends StatelessWidget {
  final MovieModel movie;
  const NowplayingItems({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final dataManagerWidgets = Provider.of<ManagerAllWidget>(context);
    return GestureDetector(
      onTap: () async {
        if (dataManagerWidgets.startMode == 0) {
          Navigator.pushNamed(context, MoviedetailsScreens.routeName,
              arguments: movie.id);
        } else {
          await Provider.of<ReviewProvider>(context, listen: false)
              .findReviewsByMovieId(movie.id!);
          Navigator.pushNamed(context, WatchingDetailsScreens.routeName,
              arguments: movie.id);
        }
      },
      child: IntrinsicHeight(
        child: Container(
          width: 250,
          //height: 500,
          decoration: BoxDecoration(
            color: AppColors.BaseColorBlackGround,
            borderRadius:
                BorderRadius.circular(Dimens.borderradius_comingsooon),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(Dimens.padding_comingSoon),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    movie.thumbnail,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 250,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Dimens.padding_comingSoon),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.name,
                      style: const TextStyle(
                        color: AppColors.BaseColorTextMain,
                        fontSize: Dimens.fontsize_comingsoon_16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines:
                          2, // Đặt maxLines thành 1 để tránh việc xuống hàng
                      overflow: TextOverflow
                          .ellipsis, // Sử dụng overflow để cắt chữ khi quá dài
                    ),
                    const SizedBox(height: Dimens.SizedBox_comingsoon_10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: Dimens.vertical_comingsoon),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star, // Icon bạn muốn sử dụng cho datetime
                            color: AppColors.BaseColorMain,
                            size: 16, // Kích thước của icon
                          ),
                          const SizedBox(
                              width: Dimens
                                  .SizedBox_comingsoon), // Khoảng cách giữa icon và text
                          Expanded(
                            child: Text(
                              movie.reviewPoint.toString(),
                              style: const TextStyle(
                                color: AppColors.BaseColorWhite,
                                fontSize: Dimens.fontsize_comingsoon_12,
                              ),
                              maxLines:
                                  1, // Đặt maxLines thành 1 để tránh việc xuống hàng
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: Dimens.vertical_comingsoon),
                      child: Row(
                        children: [
                          const Icon(
                            Icons
                                .access_time, // Icon bạn muốn sử dụng cho datetime
                            color: AppColors.BaseColorWhite,
                            size: 16, // Kích thước của icon
                          ),
                          const SizedBox(
                              width: Dimens
                                  .SizedBox_comingsoon), // Khoảng cách giữa icon và text
                          Expanded(
                            child: Text(
                              movie.duration,
                              style: const TextStyle(
                                color: AppColors.BaseColorWhite,
                                fontSize: Dimens.fontsize_comingsoon_12,
                              ),
                              maxLines:
                                  1, // Đặt maxLines thành 1 để tránh việc xuống hàng
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Dòng thêm icon cho datetime

                    const SizedBox(height: Dimens.SizedBox_comingsoon),
                    // Dòng thêm icon cho dịa điểm
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: Dimens.vertical_comingsoon),
                      child: Row(
                        children: [
                          const Icon(
                            Icons
                                .location_on, // Icon bạn muốn sử dụng cho dịa điểm
                            color: AppColors.BaseColorWhite,
                            size: Dimens
                                .fontsize_comingsoon_16, // Kích thước của icon
                          ),
                          const SizedBox(
                              width: Dimens
                                  .SizedBox_comingsoon), // Khoảng cách giữa icon và text
                          Expanded(
                            child: Text(
                              movie.category,
                              style: const TextStyle(
                                color: AppColors.BaseColorWhite,
                                fontSize: Dimens.fontsize_comingsoon_12,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
