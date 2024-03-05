import 'package:flutter/material.dart';
import 'package:movie_app_final/providers/AuthProvider.dart';
import 'package:movie_app_final/screens/home_order_movie_screen.dart';
import 'package:movie_app_final/screens/home_screen.dart';
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
      ],
      child: MaterialApp(
        title: 'MOviE',
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          HomeOrderMovie.routeName: (context) => HomeOrderMovie(),
          HomeWatchingScreen.routeName: (context) => HomeWatchingScreen(),
        },
      ),
    );
  }
}
