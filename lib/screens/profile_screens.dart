import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app_final/models/model_widget/profile_model.dart';
import 'package:movie_app_final/models/movie_model.dart';
import 'package:movie_app_final/models/order_model.dart';
import 'package:movie_app_final/models/user.dart';
import 'package:movie_app_final/providers/AuthProvider.dart';
import 'package:movie_app_final/providers/actor_providers.dart';
import 'package:movie_app_final/providers/movie_providers.dart';
import 'package:movie_app_final/providers/orders_provider.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/screens/signin_signup_screens.dart';
import 'package:movie_app_final/widgets/profile_item.dart';
import 'package:provider/provider.dart';

import '../resources/dimens.dart';

class HomeProfileScreens extends StatefulWidget {
  const HomeProfileScreens({Key? key}) : super(key: key);

  static const routeName = '/home-profile-movie';

  @override
  State<HomeProfileScreens> createState() => _ProfileScreensState();
}

class _ProfileScreensState extends State<HomeProfileScreens> {
  @override
  void initState() {
    super.initState();
    Provider.of<AuthProvider>(context, listen: false).getCurrentUser();
    Provider.of<AuthProvider>(context, listen: false).fetchUsers();
    //Provider.of<ActorProviders>(context, listen: false).addListActors();
    //Provider.of<Movieproviders>(context, listen: false).addListMovies();
    //Provider.of<Movieproviders>(context, listen: false).fetchAllMovies();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<AuthProvider>(context);
    final dataMovie = Provider.of<Movieproviders>(context);
    Users? currentUser = data.CurrentUser;
    var listUser = data.users;
    return currentUser == null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, SignIn_SignUp_Screens.routeName);
                },
                child: SvgPicture.asset(
                  './assets/icons/login.svg',
                  width: 90,
                  height: 120,
                  color: AppColors.BaseColorMain,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Please Login",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.BaseColorWhite, fontSize: 20),
              )
            ],
          )
        : RefreshIndicator(
            onRefresh: () async {
              await Provider.of<AuthProvider>(context, listen: false)
                  .getCurrentUser();
              await Provider.of<AuthProvider>(context, listen: false)
                  .fetchUsers();
              currentUser =
                  Provider.of<AuthProvider>(context, listen: false).CurrentUser;
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: ProfileItemWidget(
                currentUser: currentUser,
              ),
            ),
          );
  }
}
//
