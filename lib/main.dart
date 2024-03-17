import 'package:flutter/material.dart';
import 'package:movie_app_final/providers/AuthProvider.dart';
import 'package:movie_app_final/providers/ticket_management_provider.dart';
import 'package:movie_app_final/providers/watching_movie_provider.dart';
import 'package:movie_app_final/screens/home_order_movie_screen.dart';
import 'package:movie_app_final/screens/home_page_screens.dart';
import 'package:movie_app_final/screens/home_watching_screen.dart';
import 'package:movie_app_final/screens/profile_screens.dart';
import 'package:movie_app_final/screens/home_screen.dart';
import 'package:movie_app_final/screens/ticket_screens.dart';
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
        ChangeNotifierProvider(create: (_) => TicketManagement())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MOviE',
        initialRoute: HomepageScreens.routeName,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          HomepageScreens.routeName: (context) => HomepageScreens(),
          HomeOrderMovie.routeName: (context) => HomeOrderMovie(),
          HomeWatching.routeName: (context) => HomeWatching(),
          TicketMovieScreens.routeName: (context) => TicketMovieScreens(),
          HomeProfileScreens.routeName: (context) => HomeProfileScreens(),
        },
      ),
    );
  }
}
