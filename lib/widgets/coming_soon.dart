import 'package:flutter/material.dart';
import 'package:movie_app_final/models/model_widget/ComingSoon.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/resources/dimens.dart';

class ComingSoonItem extends StatelessWidget {
  final ComingSoon comingSoon;

  const ComingSoonItem({Key? key, required this.comingSoon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 500,
      decoration: BoxDecoration(
        color: AppColors.BaseColorBlackGround,
        borderRadius: BorderRadius.circular(Dimens.borderradius_comingsooon),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(Dimens.padding_comingSoon),
            child: Image.asset(
              'assets/${comingSoon.Image}',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 250,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(Dimens.padding_comingSoon),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comingSoon.Name ?? '',
                  style: const TextStyle(
                    color: AppColors.BaseColorTextMain,
                    fontSize: Dimens.fontsize_comingsoon_16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1, // Đặt maxLines thành 1 để tránh việc xuống hàng
                  overflow: TextOverflow.ellipsis, // Sử dụng overflow để cắt chữ khi quá dài
                ),
                const SizedBox(height: Dimens.SizedBox_comingsoon_10),
                // Dòng thêm icon cho datetime
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: Dimens.vertical_comingsoon),
                  child: Row(
                    children: [
                      Icon(
                        Icons.access_time, // Icon bạn muốn sử dụng cho datetime
                        color: AppColors.BaseColorWhite,
                        size: 16, // Kích thước của icon
                      ),
                      SizedBox(width: Dimens.SizedBox_comingsoon), // Khoảng cách giữa icon và text
                      Expanded(
                        child: Text(
                          comingSoon.Datetime ?? '',
                          style: const TextStyle(
                            color: AppColors.BaseColorWhite,
                            fontSize: Dimens.fontsize_comingsoon_12,
                          ),
                          maxLines: 1, // Đặt maxLines thành 1 để tránh việc xuống hàng
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: Dimens.SizedBox_comingsoon),
                // Dòng thêm icon cho dịa điểm  
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: Dimens.vertical_comingsoon),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on, // Icon bạn muốn sử dụng cho dịa điểm
                        color: AppColors.BaseColorWhite,
                        size: Dimens.fontsize_comingsoon_16, // Kích thước của icon
                      ),
                      SizedBox(width: Dimens.SizedBox_comingsoon), // Khoảng cách giữa icon và text
                      Expanded(
                        child: Text(
                          comingSoon.TheaterLocation ?? '',
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
    );
  }
}
