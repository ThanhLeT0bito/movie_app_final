import 'package:flutter/material.dart';
import 'package:movie_app_final/models/Nowplaying.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/resources/dimens.dart';

class NowplayingItems extends StatelessWidget {
  final Nowplaying nowplaying;
  const NowplayingItems({super.key, required this.nowplaying});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: 250,
        //height: 500,
        decoration: BoxDecoration(
          color: AppColors.BaseColorBlackGround,
          borderRadius: BorderRadius.circular(Dimens.borderradius_comingsooon),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(Dimens.padding_comingSoon),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  nowplaying.Image??'',
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
                    nowplaying.Name ?? '',
                    style: const TextStyle(
                      color: AppColors.BaseColorTextMain,
                      fontSize: Dimens.fontsize_comingsoon_16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines:
                        1, // Đặt maxLines thành 1 để tránh việc xuống hàng
                    overflow: TextOverflow
                        .ellipsis, // Sử dụng overflow để cắt chữ khi quá dài
                  ),
                  const SizedBox(height: Dimens.SizedBox_comingsoon_10),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: Dimens.vertical_comingsoon),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star, // Icon bạn muốn sử dụng cho datetime
                          color: AppColors.BaseColorMain,
                          size: 16, // Kích thước của icon
                        ),
                        SizedBox(
                            width: Dimens
                                .SizedBox_comingsoon), // Khoảng cách giữa icon và text
                        Expanded(
                          child: Text(
                            nowplaying.Star ?? '',
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
                        Icon(
                          Icons
                              .access_time, // Icon bạn muốn sử dụng cho datetime
                          color: AppColors.BaseColorWhite,
                          size: 16, // Kích thước của icon
                        ),
                        SizedBox(
                            width: Dimens
                                .SizedBox_comingsoon), // Khoảng cách giữa icon và text
                        Expanded(
                          child: Text(
                            nowplaying.Time ?? '',
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
                        Icon(
                          Icons
                              .location_on, // Icon bạn muốn sử dụng cho dịa điểm
                          color: AppColors.BaseColorWhite,
                          size: Dimens
                              .fontsize_comingsoon_16, // Kích thước của icon
                        ),
                        SizedBox(
                            width: Dimens
                                .SizedBox_comingsoon), // Khoảng cách giữa icon và text
                        Expanded(
                          child: Text(
                            nowplaying.Address ?? '',
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
    );
  }
}
