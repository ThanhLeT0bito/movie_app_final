import 'package:flutter/material.dart';
import 'package:movie_app_final/resources/app_color.dart';

class ItemMovieWithTitle extends StatelessWidget {
  const ItemMovieWithTitle({
    Key? key,
    required this.img,
    required this.title,
    this.isShowTitle = true,
    this.isWatching = false,
    this.progressValue = 0.5,
    this.width = 250,
    this.height = 150,
    this.marginRight = 20,
  }) : super(key: key);

  final String img;
  final String title;
  final bool? isShowTitle;
  final bool? isWatching;
  final double progressValue;
  final double? width;
  final double? height;
  final double marginRight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/watching-details-screen',
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: marginRight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: isWatching!
                  ? Stack(
                      children: [
                        Image.asset(
                          img,
                          width: width,
                          height: height,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: LinearProgressIndicator(
                            value: progressValue,
                            backgroundColor: Colors.grey[300],
                            valueColor: AlwaysStoppedAnimation<Color>(AppColors
                                .BaseColorMain), // Màu cam cho tiến trình
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(16)),
                          ),
                        ),
                      ],
                    )
                  : Image.asset(
                      img,
                      width: width,
                      height: height,
                      fit: BoxFit.cover,
                    ),
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
                          color: AppColors.BaseColorTextMain,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
