import 'package:flutter/material.dart';

import '../resources/app_color.dart';
import 'item_episode.dart';

class EpisodeWidget extends StatelessWidget {
  const EpisodeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ItemEpisodeWidget> listCategory = [
      ItemEpisodeWidget(
        imageUrl: 'assets/images/t4.png',
        episodeTitle: 'Episode 1',
        time: '25m',
        description: 'Romance, psychology',
      ),
      ItemEpisodeWidget(
        imageUrl: 'assets/images/t4.png',
        episodeTitle: 'Episode 2',
        time: '25m',
        description: 'Romance, psychology',
      ),
      ItemEpisodeWidget(
        imageUrl: 'assets/images/t4.png',
        episodeTitle: 'Episode 3',
        time: '25m',
        description: 'Romance, psychology',
      ),
    ];

    return Container(
      color: AppColors.BaseColorBlack,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: listCategory.length,
              itemBuilder: (context, index) {
                // Trả về mỗi widget danh mục trong danh sách
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: listCategory[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
