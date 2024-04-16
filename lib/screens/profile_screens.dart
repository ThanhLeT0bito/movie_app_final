import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_final/models/model_widget/profile_model.dart';
import 'package:movie_app_final/providers/AuthProvider.dart';
import 'package:movie_app_final/resources/app_color.dart';
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
  Widget build(BuildContext context) {
    final data = Provider.of<AuthProvider>(context);
    var currentUser = data.CurrentUser;
    return ProfileItemWidget(
      currentUser: currentUser,
    );
  }
}
//