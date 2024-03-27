import 'package:flutter/material.dart';
import 'package:movie_app_final/models/Nowplaying.dart';

class NowplayingManagement extends ChangeNotifier {
  List<Nowplaying> listNowplaying = [
    Nowplaying(
      Name: 'Mai',
      Time: '2 hour 5 minutes',
      Address: 'Adventure, Sci-fi',
      Star: '4.0',
      Image: 'assets/images/img_3.jpg',
    ),
    Nowplaying(
      Name: 'Phở, đào và piano',
      Time: '2 hour 10 minutes',
      Address: 'Adventure, Sci-fi',
      Star: '4.0',
      Image: 'assets/images/img_1.jpg',
    ),
    Nowplaying(
      Name: 'Gặp lại chị bầu',
      Time: '2 hour 29 minutes',
      Address: 'Adventure, Sci-fi',
      Star: '4.0',
      Image: 'assets/images/img_2.jpg',
    ),
    Nowplaying(
      Name: 'Bà thím báo thù',
      Time: '2 hour 10 minutes',
      Address: 'Adventure, Sci-fi',
      Star: '4.0',
      Image: 'assets/images/ba_thim.jpg',
    ),
  ];

  List<Nowplaying> listCommingSoon = [
    Nowplaying(
      Name: 'Doraemon movie 43',
      Time: '20.12.2023',
      Address: 'Adventure, Sci-fi',
      Star: '4.0',
      Image: 'assets/images/doraemon.jpg',
    ),
    Nowplaying(
      Name: 'Spy x family CODE: White',
      Time: '25.12.2022',
      Address: 'Adventure, Sci-fi',
      Star: '4.0',
      Image: 'assets/images/spy.png',
    ),
    Nowplaying(
      Name: 'Shazam: Fury of the Gods',
      Time: '20.12.2022',
      Address: 'Adventure, Sci-fi',
      Star: '4.0',
      Image: 'assets/images/popstar.png',
    ),
    Nowplaying(
      Name: 'Fox puss in Boots: The last Wish',
      Time: '20.12.2022',
      Address: 'Adventure, Sci-fi',
      Star: '4.0',
      Image: 'assets/images/tom_jerry.png',
    ),
  ];

  List<Nowplaying> listMovies = [];

  NowplayingManagement() {
    if (isNowplaySelected)
      listMovies = List<Nowplaying>.from(listNowplaying);
    else
      listMovies = List<Nowplaying>.from(listCommingSoon);
  }

  var isNowplaySelected = false;

  void changeNowPlaySelected() {
    isNowplaySelected = !isNowplaySelected;
    if (isNowplaySelected)
      listMovies = List<Nowplaying>.from(listNowplaying);
    else
      listMovies = List<Nowplaying>.from(listCommingSoon);

    notifyListeners();
  }
}
