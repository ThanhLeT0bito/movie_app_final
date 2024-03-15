import 'package:flutter/material.dart';
import 'package:movie_app_final/models/model_widget/ComingSoon.dart';
import 'package:movie_app_final/providers/Comingsoon_provider.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/resources/dimens.dart';
import 'package:movie_app_final/screens/now_playing_screens.dart';
import 'package:movie_app_final/widgets/coming_soon.dart';
import 'package:provider/provider.dart';

class ComingSoonScreens extends StatefulWidget {
  const ComingSoonScreens({Key? key}) : super(key: key);
  static const routeName = '/home-coming-soon';

  @override
  State<ComingSoonScreens> createState() => _ComingSoonScreensState();
}

class _ComingSoonScreensState extends State<ComingSoonScreens> {
  bool isNowPlayingSelected = false;
  bool isComingSoonSelected = true;

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ComingSoonManagement>(context);
    List<ComingSoon> listComingSoon = data.listComingSoon;

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
                  Navigator.pushNamed(context, NowplayingScreens.routeName);
                  setState(() {
                    isNowPlayingSelected = true;
                    isComingSoonSelected = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: isNowPlayingSelected ? AppColors.BaseColorMain : AppColors.BackgroundButton,
                  onPrimary: isNowPlayingSelected ? Colors.black : AppColors.font,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: Dimens.horizontal_comingsoon_40, vertical: Dimens.vertical_comingsoon_20),
                ),
                child: const Text('Now Playing', style: TextStyle(fontSize: Dimens.fontsize_comingsoon_18)),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isNowPlayingSelected = false;
                    isComingSoonSelected = true;
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: isComingSoonSelected ? AppColors.BaseColorMain : AppColors.BackgroundButton,
                  onPrimary: isComingSoonSelected ? Colors.black : AppColors.font,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: Dimens.horizontal_comingsoon_40, vertical: Dimens.vertical_comingsoon_20),
                ),
                child: const Text('Coming Soon', style: TextStyle(fontSize: Dimens.fontsize_comingsoon_18)),
              ),
            ],
          ),
          const SizedBox(height: Dimens.SizedBox_comingsoon_10,),
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
                itemCount: listComingSoon.length,
                itemBuilder: (BuildContext context, int index) {
                  return ComingSoonItem(comingSoon: listComingSoon[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
