import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:movie_app_final/models/data_local/UserPreferences%20.dart';
import 'package:movie_app_final/providers/auth_provider.dart';
import 'package:movie_app_final/providers/homepage_provider.dart';
import 'package:movie_app_final/providers/nowplaying_provider.dart';
import 'package:movie_app_final/providers/actor_providers.dart';
import 'package:movie_app_final/providers/home_refactor_provider.dart';
import 'package:movie_app_final/providers/language_provider.dart';
import 'package:movie_app_final/providers/manager_all_widget.dart';
import 'package:movie_app_final/providers/movie_providers.dart';
import 'package:movie_app_final/providers/orders_provider.dart';
import 'package:movie_app_final/providers/seats_provider.dart';
import 'package:movie_app_final/providers/ticket_management_provider.dart';
import 'package:movie_app_final/providers/watching_movie_provider.dart';
import 'package:movie_app_final/screens/Enter_Username_screens.dart';
import 'package:movie_app_final/screens/change_password_screens.dart';
import 'package:movie_app_final/screens/choose_your_need_screens.dart';
import 'package:movie_app_final/screens/confirm_otp_screens.dart';
import 'package:movie_app_final/screens/delete_account_screens.dart';
import 'package:movie_app_final/screens/edit_profile_screen.dart';
import 'package:movie_app_final/screens/home_order_movie_screen.dart';
import 'package:movie_app_final/screens/home_page_screens.dart';
import 'package:movie_app_final/screens/home_watching_screen.dart';
import 'package:movie_app_final/screens/movie_details.dart';
import 'package:movie_app_final/screens/now_playing_screens.dart';
import 'package:movie_app_final/screens/payment_screens.dart';
import 'package:movie_app_final/screens/profile_screens.dart';
import 'package:movie_app_final/screens/home_screen.dart';
import 'package:movie_app_final/screens/rate_screen.dart';
import 'package:movie_app_final/screens/select_seat_screen.dart';
import 'package:movie_app_final/screens/signin_screens.dart';
import 'package:movie_app_final/screens/signin_signup_screens.dart';
import 'package:movie_app_final/screens/ticket_screen.dart';
import 'package:movie_app_final/screens/ticket_screens.dart';
import 'package:movie_app_final/screens/watching_movie_detail.dart';
import 'package:movie_app_final/screens/list_category.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //await UserPreferences.setUserId('');
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
        ChangeNotifierProvider(create: (_) => HomeRefactorProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider())
      ],
      child: Consumer<ManagerAllWidget>(builder: (context, manager, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MOviE',
          locale: Provider.of<LanguageProvider>(context).locale,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          initialRoute:
              //HomeScreen.routeName,
              manager.startScreen,
          routes: {
            HomeScreen.routeName: (context) =>const HomeScreen(),
            HomepageScreens.routeName: (context) =>const HomepageScreens(),
            HomeOrderMovie.routeName: (context) =>const HomeOrderMovie(),
            HomeWatching.routeName: (context) =>const HomeWatching(),
            TicketMovieScreens.routeName: (context) =>const TicketMovieScreens(),
            NowplayingScreens.routeName: (context) =>const NowplayingScreens(),
            HomeProfileScreens.routeName: (context) => const HomeProfileScreens(),
            MoviedetailsScreens.routeName: (context) => const MoviedetailsScreens(),
            SelectSeatScreen.routeName: (context) => const SelectSeatScreen(),
            EnterUserNameScreens.routeName: (context) => const EnterUserNameScreens(),
            ConfirmOTPScreens.routeName: (context) => const ConfirmOTPScreens(),
            SignInScreens.routeName: (context) =>const SignInScreens(),
            ChooseNeed.routeName: (context) => const ChooseNeed(),
            SignInSignUpScreens.routeName: (context) => const
                SignInSignUpScreens(),
            TicketScreen.routeName: (context) => const TicketScreen(),
            PaymentScreens.routeName: (context) =>const PaymentScreens(),
            WatchingDetailsScreens.routeName: (context) =>
            const  WatchingDetailsScreens(),
            EditProfileScreen.routeName: (context) =>const EditProfileScreen(),
            ChangePasswordScreens.routeName: (context) =>
            const  ChangePasswordScreens(),
            DeleteAccountScreens.routeName: (context) =>const DeleteAccountScreens(),
            RateScreen.routeName: (context) =>const RateScreen(),
            CategoryScreens.routeName: (context) =>const CategoryScreens(),
            TrailerScreen.routeName: (context) =>const TrailerScreen(trailerUrl: ''),
          },
        );
      }),
    );
  }
}
