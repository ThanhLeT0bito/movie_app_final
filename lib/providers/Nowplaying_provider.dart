import 'package:flutter/material.dart';
import 'package:movie_app_final/models/Nowplaying.dart';

class NowplayingManagement extends ChangeNotifier {
  List<Nowplaying> listNowplaying = [
    Nowplaying(
      Name: 'Doraemon movie 43',
      Time: '20.12.2022',
      Address: 'Adventure, Sci-fi',
      Star: '4.0',
      Image: 'img_1.jpg',
    ),
    Nowplaying(
      Name: 'Doraemon movie 77',
      Time: '20.12.2022',
      Address: 'Adventure, Sci-fi',
      Star: '4.0',
      Image: 'img_3.jpg',
    ),
    Nowplaying(
      Name: 'Doraemon movie 11',
      Time: '20.12.2022',
      Address: 'Adventure, Sci-fi',
      Star: '4.0',
      Image: 'img_2.jpg',
    ),
    Nowplaying(
      Name: 'Doraemon movie 20',
      Time: '20.12.2022',
      Address: 'Adventure, Sci-fi',
      Star: '4.0',
      Image: 'img_2.jpg',
    ),
  ];

  List<Nowplaying> listCommingSoon = [
    Nowplaying(
      Name: 'Mai',
      Time: '20.12.2023',
      Address: 'Adventure, Sci-fi',
      Star: '4.0',
      Image: 'img_3.jpg',
    ),
    Nowplaying(
      Name: 'Spy family',
      Time: '20.12.2022',
      Address: 'Adventure, Sci-fi',
      Star: '4.0',
      Image: 'img_1.jpg',
    ),
    Nowplaying(
      Name: 'Doraemon movie 11',
      Time: '20.12.2022',
      Address: 'Adventure, Sci-fi',
      Star: '4.0',
      Image: 'img_2.jpg',
    ),
    Nowplaying(
      Name: 'Doraemon movie 20',
      Time: '20.12.2022',
      Address: 'Adventure, Sci-fi',
      Star: '4.0',
      Image: 'img_1.jpg',
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
