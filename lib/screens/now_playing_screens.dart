import 'package:flutter/material.dart';
import 'package:movie_app_final/models/Nowplaying.dart';
import 'package:movie_app_final/providers/Nowplaying_provider.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/resources/dimens.dart';
import 'package:movie_app_final/widgets/now_playing.dart';
import 'package:provider/provider.dart';

// Import các thư viện cần thiết

class NowplayingScreens extends StatefulWidget {
  const NowplayingScreens({Key? key}) : super(key: key);
  static const routeName = '/home-now-playing';

  @override
  State<NowplayingScreens> createState() => _NowplayingScreensState();
}

class _NowplayingScreensState extends State<NowplayingScreens> {
  bool isNowPlayingSelected = true;
  bool isComingSoonSelected = false;

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<NowplayingManagement>(context);
    List<Nowplaying> listNowplaying = data.listNowplaying;

    return Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      body: Column(
        children: [
          const SizedBox(height: 56),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isNowPlayingSelected = true;
                    isComingSoonSelected = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: isNowPlayingSelected
                      ? AppColors.BaseColorMain
                      : AppColors.BackgroundButton,
                  onPrimary:
                      isNowPlayingSelected ? Colors.black : AppColors.font,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.horizontal_comingsoon_40,
                      vertical: Dimens.vertical_comingsoon_20),
                ),
                child: const Text('Now Playing',
                    style: TextStyle(fontSize: Dimens.fontsize_comingsoon_18)),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Navigator.pushNamed(context, ComingSoonScreens.routeName);
                    isNowPlayingSelected = false;
                    isComingSoonSelected = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: isComingSoonSelected
                      ? AppColors.BaseColorMain
                      : AppColors.BackgroundButton,
                  onPrimary:
                      isComingSoonSelected ? Colors.black : AppColors.font,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimens.horizontal_comingsoon_40,
                      vertical: Dimens.vertical_comingsoon_20),
                ),
                child: const Text('Coming Soon',
                    style: TextStyle(fontSize: Dimens.fontsize_comingsoon_18)),
              ),
            ],
          ),
          const SizedBox(
            height: Dimens.SizedBox_comingsoon_10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(Dimens.padding_comingSoon),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.45,
                ),
                itemCount: listNowplaying.length,
                itemBuilder: (BuildContext context, int index) {
                  return NowplayingItems(nowplaying: listNowplaying[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
