import 'dart:async';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_app_final/models/model_widget/item_radio.dart';
import 'package:movie_app_final/screens/home_page_screens.dart';
import 'package:movie_app_final/screens/home_screen.dart';
import 'package:movie_app_final/screens/home_watching_screen.dart';
import 'package:movie_app_final/screens/movie_details.dart';
import 'package:movie_app_final/screens/now_playing_screens.dart';
import 'package:movie_app_final/screens/profile_screens.dart';
import 'package:movie_app_final/screens/signin_signup_screens.dart';
import 'package:movie_app_final/screens/ticket_screens.dart';
import 'package:movie_app_final/widgets/Base/custom_bottom_navigator.dart';
import 'package:movie_app_final/widgets/Base/custom_bottom_sheet.dart';
import 'package:movie_app_final/widgets/Base/custom_item_radio.dart';
import 'package:movie_app_final/widgets/custom_item_bottom__bar.dart';

class ManagerAllWidget extends ChangeNotifier {
  String startScreen = SignIn_SignUp_Screens.routeName;
  //String startScreen = HomeScreen.routeName;
  //mode
  bool isBookingScreen = false;

  late List<Widget> bottomnavigations = [];
  late List<CustomItemBottomBar> bottomNavBarItems = [];

  late int _selectedIndex;

  late CustomBottomNavigationBar CustomBottomnavi;

  int get selectedIndex => _selectedIndex;

  ManagerAllWidget() {
    _selectedIndex = 0;
    bottomNavBarItems = bottomNavBarItemsBooking;
    bottomnavigations = _screensBooking;
    setBottomItem(_selectedIndex);
  }

  void setBottomItem(int index) {
    print(index);
    _selectedIndex = index;
    for (var i = 0; i < bottomNavBarItems.length; i++) {
      bottomNavBarItems[i] = CustomItemBottomBar(
        icon: bottomNavBarItems[i].icon,
        label: bottomNavBarItems[i].label,
        isSelected: i == index,
      );
    }
    
    CustomBottomnavi = CustomBottomNavigationBar(
      bottomNavBarItems: bottomNavBarItems,
      onItemTapped: setBottomItem,
      selectedIndex: _selectedIndex,
    );
    notifyListeners();
  }

  ////MODE Watching or Booking
  int startMode = 0;
  int startModeTemp = 0;

  void changeStartModeTemp(int start) {
    startModeTemp = start;
    print("Temp Mode: $start");
    for (var i = 0; i < listItemCustom.length; i++) {
      listItemCustom[i] = ItemRadio(
        img: listItemCustom[i].img,
        text: listItemCustom[i].text,
        isSelected: start == i,
      );
    }
    notifyListeners();
  }

  void SaveStartMode() {
    startMode = startModeTemp;
    changeMode();
    notifyListeners();
  }

  late List<ItemRadio> listItemCustom = [
    ItemRadio(
        isSelected: true,
        text: "Booking Ticket",
        img: "assets/images/booking.png"),
    ItemRadio(
        isSelected: false,
        text: "Watching Movie",
        img: "assets/images/watching.png"),
  ];

  void ShowBottomSheetMode(BuildContext context) {
    print("Show Bottom Sheet");
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return CustomBottomSheet(
            title: 'Choose Mode',
            subTitle: 'which mode do you want to use?',
            textButton: "Use it",
            onButtonPressed: () => changeMode,
            widget: CustomItemRadio(groupRadio: listItemCustom),
          );
        });
    notifyListeners();
  }

  void changeMode() {
    _selectedIndex = 0;
    //startMode = startModeTemp;
    bottomnavigations = startMode == 0 ? _screensBooking : _screensWatching;
    bottomNavBarItems =
        startMode == 0 ? bottomNavBarItemsBooking : bottomNavBarItemsWatching;
    print("Start Mode: $startMode");
    notifyListeners();
  }

  List<Widget> _screensBooking = [
    HomepageScreens(),
    TicketMovieScreens(),
    NowplayingScreens(),
    HomeProfileScreens(),
  ];
  List<Widget> _screensWatching = [
    HomeWatching(),
    TicketMovieScreens(),
    NowplayingScreens(),
    HomeProfileScreens(),
  ];
  List<CustomItemBottomBar> bottomNavBarItemsBooking = [
    CustomItemBottomBar(
      icon: Iconsax.home_15,
      label: "Home",
      isSelected: false,
    ),
    CustomItemBottomBar(
      icon: Iconsax.ticket,
      label: "Ticket",
      isSelected: false,
    ),
    CustomItemBottomBar(
      icon: Iconsax.video4,
      label: "Movie",
      isSelected: false,
    ),
    CustomItemBottomBar(
      icon: Iconsax.profile_circle,
      label: "Profile",
      isSelected: false,
    ),
  ];
  List<CustomItemBottomBar> bottomNavBarItemsWatching = [
    CustomItemBottomBar(
      icon: Iconsax.home_15,
      label: "Home",
      isSelected: false,
    ),
    CustomItemBottomBar(
      icon: Iconsax.ticket,
      label: "Ticket",
      isSelected: false,
    ),
    CustomItemBottomBar(
      icon: Iconsax.video4,
      label: "Movie",
      isSelected: false,
    ),
    CustomItemBottomBar(
      icon: Iconsax.profile_circle,
      label: "Profile",
      isSelected: false,
    ),
  ];
}
