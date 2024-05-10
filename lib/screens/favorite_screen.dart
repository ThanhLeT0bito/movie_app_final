import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_final/models/data_local/favorite_model.dart';

import '../resources/app_color.dart';
import '../widgets/Base/custom_app_bar.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  static const routeName = '/favorite_screen';

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: CustomAppBar(
              title: 'My Favorites Movie',
              showBackButton: false,
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GridView.builder(
              shrinkWrap: false,
              physics: const AlwaysScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.75),
              itemCount: listData.length,
              itemBuilder: (contex, index) {
                return GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/${listData[index].image}.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 6, top: 3),
                        child: Align(
                          alignment: Alignment.topRight,
                          child:
                              Image.asset("assets/icons/ic_favorite_boder.png"),
                        ),
                      ),
                    ));
              },
            ),
          ))
        ],
      ),
    );
  }
}
