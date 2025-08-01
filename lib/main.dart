import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:movie_app_final/models/data_local/UserPreferences%20.dart';
import 'package:movie_app_final/providers/AuthProvider.dart';
import 'package:movie_app_final/providers/Homepage_provider.dart';
import 'package:movie_app_final/providers/Nowplaying_provider.dart';
import 'package:movie_app_final/providers/actor_providers.dart';
import 'package:movie_app_final/providers/manager_all_widget.dart';
import 'package:movie_app_final/providers/movie_providers.dart';
import 'package:movie_app_final/providers/orders_provider.dart';
import 'package:movie_app_final/providers/review_provider.dart';
import 'package:movie_app_final/providers/seats_provider.dart';
import 'package:movie_app_final/providers/ticket_management_provider.dart';
import 'package:movie_app_final/providers/watching_movie_provider.dart';
import 'package:movie_app_final/screens/Enter_Username_screens.dart';
import 'package:movie_app_final/screens/category_screen.dart';
import 'package:movie_app_final/screens/change_password_screens.dart';
import 'package:movie_app_final/screens/choose_your_need_screens.dart';
import 'package:movie_app_final/screens/confirm_OTP_screens.dart';
import 'package:movie_app_final/screens/delete_account_screens.dart';
import 'package:movie_app_final/screens/edit_profile_screen.dart';
import 'package:movie_app_final/screens/favorite_screen.dart';
import 'package:movie_app_final/screens/home_order_movie_screen.dart';
import 'package:movie_app_final/screens/home_page_screens.dart';
import 'package:movie_app_final/screens/home_watching_screen.dart';
import 'package:movie_app_final/screens/movie_details.dart';
import 'package:movie_app_final/screens/now_playing_screens.dart';
import 'package:movie_app_final/screens/payment_screens.dart';
import 'package:movie_app_final/screens/profile_screens.dart';
import 'package:movie_app_final/screens/home_screen.dart';
import 'package:movie_app_final/screens/rate_screen.dart';
import 'package:movie_app_final/screens/search_screen.dart';
import 'package:movie_app_final/screens/select_seat_screen.dart';
import 'package:movie_app_final/screens/show_video.dart';
import 'package:movie_app_final/screens/signin_screens.dart';
import 'package:movie_app_final/screens/signin_signup_screens.dart';
import 'package:movie_app_final/screens/ticket_screen.dart';
import 'package:movie_app_final/screens/ticket_screens.dart';
import 'package:movie_app_final/screens/watching_movie_detail.dart';
import 'package:movie_app_final/screens/list_category.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await UserPreferences.setUserId('66117c988b3a5f94e2eed80a');
  final preferences = await UserPreferences.getUserId();
  runApp(MyApp(preferences: preferences));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.preferences});

  final String preferences;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ManagerAllWidget(preferences)),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => Movieproviders()),
        ChangeNotifierProvider(create: (_) => OrdersProvider()),
        ChangeNotifierProvider(create: (_) => WatchingMovieProvider()),
        ChangeNotifierProvider(create: (_) => TicketManagement()),
        ChangeNotifierProvider(create: (_) => NowplayingManagement()),
        ChangeNotifierProvider(create: (_) => HomepageManagement()),
        ChangeNotifierProvider(create: (_) => SeatsProviders()),
        ChangeNotifierProvider(create: (_) => ActorProviders()),
        ChangeNotifierProvider(create: (_) => ReviewProvider()),
      ],
      child: Consumer<ManagerAllWidget>(builder: (context, manager, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MOviE',
          // ignore: unrelated_type_equality_checks
          initialRoute:
              //SignIn_SignUp_Screens.routeName,
              // HomeScreen.routeName,
              manager.startScreen,
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
            EditProfileScreen.routeName: (context) => EditProfileScreen(),
            ChangePasswordScreens.routeName: (context) =>
                ChangePasswordScreens(),
            DeleteAccountScreens.routeName: (context) => DeleteAccountScreens(),
            RateScreen.routeName: (context) => RateScreen(),
            CategoryScreens.routeName: (context) => CategoryScreens(),
            TrailerScreen.routeName: (context) => TrailerScreen(trailerUrl: ''),
            SearchScreen.routeName: (context) => SearchScreen(),
            CategoryScreen.routeName: (context) => CategoryScreen(),
            FavoriteScreen.routeName: (context) => const FavoriteScreen(),
          },
        );
      }),
    );
  }
}
