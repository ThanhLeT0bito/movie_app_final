import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';

class ItemMovieWithTitle extends StatelessWidget {
  const ItemMovieWithTitle({
    super.key,
    required this.img,
    required this.title,
    this.isShowTitle =
        true, // hiện tại mấy cái , page mới mấy chỗ category á thì chỉ cần thêm, isShowtitle = false là okok
  });
  final String img;
  final String title;
  final bool? isShowTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            img,
            width: 250,
            height: 150,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 5),
          isShowTitle!
              ? Container(
                  width: 230,
                  padding: const EdgeInsets.all(5),
                  child: SizedBox(
                    height: 50,
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                          color: AppColors.BaseColorTextMain, fontSize: 18),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
