import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../resources/app_color.dart';
import 'item_movie_title.dart';

class ItemEpisodeWidget extends StatelessWidget {
  const ItemEpisodeWidget({
    Key? key,
    required this.imageUrl,
    required this.episodeTitle,
    required this.time,
    required this.description,
    this.isWatching = false,
    this.progressValue = 0.5,
  }) : super(key: key);
  final String imageUrl;
  final String episodeTitle;
  final String time;
  final String description;
  final bool? isWatching;
  final double? progressValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // Image on the left
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ItemMovieWithTitle(
                    img: imageUrl,
                    title: "The Godzila Avenger Game.",
                    isShowTitle: false,
                    isWatching: true,
                    progressValue: 0.5,
                    width: 150,
                    height: 100,
                    marginRight: 0,
                  ),
                  // Stack(children: [
                  //   Container(
                  //     width: 150,
                  //     height: 100,
                  //     decoration: BoxDecoration(
                  //       image: DecorationImage(
                  //         image: AssetImage(imageUrl),
                  //         fit: BoxFit.cover,
                  //       ),
                  //       borderRadius: BorderRadius.circular(5),
                  //     ),
                  //   ),
                  //   Positioned(
                  //     left: 0,
                  //     right: 0,
                  //     bottom: 0,
                  //     child: Container(
                  //       width: 150,
                  //       height: 4,
                  //       decoration: BoxDecoration(
                  //         color: AppColors.BaseColorGrey.withOpacity(0.9),
                  //         borderRadius: const BorderRadius.only(
                  //           bottomLeft: Radius.circular(10),
                  //           bottomRight: Radius.circular(10),
                  //         ),
                  //       ),
                  //       child: LinearProgressIndicator(
                  //         value: 0.3, // This value is between 0 and 1
                  //         backgroundColor: AppColors.BaseColorGrey.withOpacity(0.9),
                  //         valueColor: AlwaysStoppedAnimation<Color>(
                  //             AppColors.BaseColorMain.withOpacity(0.9)),
                  //       ),
                  //     ),
                  //   ),
                  // ]),
                  const SizedBox(
                      width: 16), // Add some space between image and text
                  // Text on the right
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        episodeTitle,
                        style:
                        const TextStyle(fontSize: 16, color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10), // Add some space
                      Text(
                        time,
                        style:
                        const TextStyle(fontSize: 16, color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                description,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(
                                  color: AppColors.BaseColorWhite,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Download icon
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.file_download_outlined,
                      color: Colors.white))
            ],
          ),
          // Icon centered vertically
        ],
      ),
    );
  }
}
