import 'package:flutter/material.dart';
import 'package:movie_app_final/models/Nowplaying.dart';
import 'package:movie_app_final/models/movie_model.dart';
import 'package:movie_app_final/providers/Nowplaying_provider.dart';
import 'package:movie_app_final/providers/movie_providers.dart';
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
    final dataMovie = Provider.of<Movieproviders>(context);

    List<MovieModel> listNowplaying = dataMovie.listShowNowComming;

    isNowPlayingSelected = dataMovie.isNowplaySelected;
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: AppColors.BaseColorBlackGround,
      child: Column(
        children: [
          const SizedBox(height: 50),
          Container(
            width: screenWidth - 20,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
                color: AppColors.BackgroundButton,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    if (!isNowPlayingSelected) {
                      dataMovie.changeNowPlaySelected();
                      // setState(() {
                      //   isNowPlayingSelected = true;
                      //   listNowplaying = dataMovie.listMovieNowPlaying;
                      // });
                    }
                  },
                  child: Container(
                    width: 175,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: isNowPlayingSelected
                            ? AppColors.BaseColorMain
                            : AppColors.BaseColorTransparent,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Now playing",
                        style: TextStyle(
                            color: isNowPlayingSelected
                                ? AppColors.BaseColorBlack
                                : Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (isNowPlayingSelected) {
                      dataMovie.changeNowPlaySelected();
                      // setState(() {
                      //   isNowPlayingSelected = false;
                      //   listNowplaying = dataMovie.listMovieCommingSoon;
                      // });
                    }
                  },
                  child: Container(
                    width: 175,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: isNowPlayingSelected
                            ? AppColors.BaseColorTransparent
                            : AppColors.BaseColorMain,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Comming Soon",
                        style: TextStyle(
                            color: isNowPlayingSelected
                                ? Colors.grey
                                : AppColors.BaseColorBlack,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.padding_comingSoon),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                  childAspectRatio: 0.45,
                ),
                itemCount: listNowplaying.length,
                itemBuilder: (BuildContext context, int index) {
                  return NowplayingItems(movie: listNowplaying[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
