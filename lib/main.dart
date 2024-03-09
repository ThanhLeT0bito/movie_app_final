import 'package:flutter/material.dart';
import 'package:movie_app_final/providers/AuthProvider.dart';
import 'package:movie_app_final/providers/watching_movie_provider.dart';
import 'package:movie_app_final/screens/home_order_movie_screen.dart';
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
        ChangeNotifierProvider(create: (_) => WatchingMovieProvider())
      ],
      child: MaterialApp(
        title: 'MOviE',
        initialRoute: TicketMovieScreens.routeName,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          HomeOrderMovie.routeName: (context) => HomeOrderMovie(),
          HomeWatchingScreen.routeName: (context) => HomeWatchingScreen(),
          TicketMovieScreens.routeName:(context) => TicketMovieScreens(),
          HomeProfileScreens.routeName:(context) => HomeProfileScreens(),
        },
      ),
    );
  }
}
