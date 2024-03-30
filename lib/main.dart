import 'package:flutter/material.dart';
import 'package:movie_app_final/models/model_widget/profile_model.dart';
import 'package:movie_app_final/providers/AuthProvider.dart';
import 'package:movie_app_final/providers/Homepage_provider.dart';
import 'package:movie_app_final/providers/Nowplaying_provider.dart';
import 'package:movie_app_final/providers/manager_all_widget.dart';
import 'package:movie_app_final/providers/seats_provider.dart';
import 'package:movie_app_final/providers/ticket_management_provider.dart';
import 'package:movie_app_final/providers/watching_movie_provider.dart';
import 'package:movie_app_final/screens/Enter_Username_screens.dart';
import 'package:movie_app_final/screens/choose_your_need_screens.dart';
import 'package:movie_app_final/screens/confirm_OTP_screens.dart';
import 'package:movie_app_final/screens/home_order_movie_screen.dart';
import 'package:movie_app_final/screens/home_page_screens.dart';
import 'package:movie_app_final/screens/home_watching_screen.dart';
import 'package:movie_app_final/screens/movie_details.dart';
import 'package:movie_app_final/screens/now_playing_screens.dart';
import 'package:movie_app_final/screens/payment_screens.dart';
import 'package:movie_app_final/screens/profile_screens.dart';
import 'package:movie_app_final/screens/home_screen.dart';
import 'package:movie_app_final/screens/select_seat_screen.dart';
import 'package:movie_app_final/screens/signin_screens.dart';
import 'package:movie_app_final/screens/signin_signup_screens.dart';
import 'package:movie_app_final/screens/ticket_screen.dart';
import 'package:movie_app_final/screens/ticket_screens.dart';
import 'package:movie_app_final/screens/watching_movie_detail.dart';
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
        ChangeNotifierProvider(create: (_) => ManagerAllWidget()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => WatchingMovieProvider()),
        ChangeNotifierProvider(create: (_) => TicketManagement()),
        ChangeNotifierProvider(create: (_) => NowplayingManagement()),
        ChangeNotifierProvider(create: (_) => HomepageManagement()),
        ChangeNotifierProvider(create: (_) => SeatsProviders()),

        /// sang tha
      ],
      child: Consumer<ManagerAllWidget>(builder: (context, manager, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MOviE',
          initialRoute: manager.startScreen,
          routes: {
            HomeScreen.routeName: (context) => HomeScreen(),
            HomepageScreens.routeName: (context) => HomepageScreens(),
            HomeOrderMovie.routeName: (context) => HomeOrderMovie(),
            HomeWatching.routeName: (context) => HomeWatching(),
            TicketMovieScreens.routeName: (context) => TicketMovieScreens(),
            NowplayingScreens.routeName: (context) => NowplayingScreens(),
            HomeProfileScreens.routeName: (context) => HomeProfileScreens(),
            MoviedetailsScreens.routeName: (context) => MoviedetailsScreens(),
            SelectSeatScreen.routeName: (context) => SelectSeatScreen(),
            EnterUserNameScreens.routeName: (context) => EnterUserNameScreens(),
            ConfirmOTPScreens.routeName: (context) => ConfirmOTPScreens(),
            SignInScreens.routeName: (context) => SignInScreens(),
            ChooseNeed.routeName: (context) => ChooseNeed(),
            SignIn_SignUp_Screens.routeName: (context) =>
                SignIn_SignUp_Screens(),
            TicketScreen.routeName: (context) => const TicketScreen(),
            PaymentScreens.routeName: (context) => PaymentScreens(),
            WatchingDetailsScreens.routeName: (context) =>
                WatchingDetailsScreens(),
          },
        );
      }),
    );
  }
}
