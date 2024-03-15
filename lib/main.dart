import 'package:flutter/material.dart';
import 'package:movie_app_final/providers/AuthProvider.dart';
import 'package:movie_app_final/providers/Comingsoon_provider.dart';
import 'package:movie_app_final/providers/Homepage_provider.dart';
import 'package:movie_app_final/providers/Nowplaying_provider.dart';
import 'package:movie_app_final/providers/ticket_management_provider.dart';
import 'package:movie_app_final/providers/watching_movie_provider.dart';
import 'package:movie_app_final/screens/coming_Soon_screens.dart';
import 'package:movie_app_final/screens/home_order_movie_screen.dart';
import 'package:movie_app_final/screens/home_page_screens.dart';
import 'package:movie_app_final/screens/now_playing_screens.dart';
import 'package:movie_app_final/screens/profile_screens.dart';
import 'package:movie_app_final/screens/home_screen.dart';
import 'package:movie_app_final/screens/ticket_screens.dart';
import 'package:movie_app_final/screens/home_watching_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => WatchingMovieProvider()),
        ChangeNotifierProvider(create: (_) => TicketManagement()),
        ChangeNotifierProvider(create: (_) => ComingSoonManagement()),
        ChangeNotifierProvider(create: (_) => NowplayingManagement()),
        ChangeNotifierProvider(create: (_) => HomepageManagement()),
      ],
      child: MaterialApp(
        title: 'MOviE',
        initialRoute: HomepageScreens.routeName,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          HomeOrderMovie.routeName: (context) => HomeOrderMovie(),
          HomeWatchingScreen.routeName: (context) => HomeWatchingScreen(),
          TicketMovieScreens.routeName: (context) => TicketMovieScreens(),
          HomeProfileScreens.routeName: (context) => HomeProfileScreens(),
          ComingSoonScreens.routeName:(context) => ComingSoonScreens(),
          NowplayingScreens.routeName:(context) => NowplayingScreens(),
          HomepageScreens.routeName:(context) => HomepageScreens(),
          //SeatScreens.routeName:(context) => SeatScreens(),
        },
      ),
    );
  }
}
