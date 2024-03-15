import 'package:flutter/material.dart';
import 'package:movie_app_final/providers/AuthProvider.dart';
import 'package:movie_app_final/providers/watching_movie_provider.dart';
import 'package:provider/provider.dart';

import '../resources/app_color.dart';
import '../widgets/Base/custom_app_bar.dart';

class HomeWatching extends StatefulWidget {
  const HomeWatching({super.key});
  static const routeName = '/home-watching';

  @override
  State<HomeWatching> createState() => _HomeWatchingState();
}

class _HomeWatchingState extends State<HomeWatching> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      body: Column(
        children: [
          CustomAppBar(
            title: "Home Watching",
          ),
          Expanded(
            child: Center(
              child: Text('Hello'),
            ),
          ),
        ],
      ),
    );
  }
}
