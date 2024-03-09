import 'package:flutter/material.dart';
import 'package:movie_app_final/providers/AuthProvider.dart';
import 'package:movie_app_final/providers/watching_movie_provider.dart';
import 'package:provider/provider.dart';

class HomeWatchingScreen extends StatefulWidget {
  const HomeWatchingScreen({super.key});

  static const routeName = '/home-watching-screen';

  @override
  State<HomeWatchingScreen> createState() => _HomeWatchingScreenState();
}

class _HomeWatchingScreenState extends State<HomeWatchingScreen> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<WatchingMovieProvider>(context);
    print("số lượng carousel: ${data.listCarousel.length} ");
    return const Scaffold(
      body: Center(child: Text('hello')),
    );
  }
}
