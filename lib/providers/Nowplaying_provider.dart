import 'package:flutter/material.dart';
import 'package:movie_app_final/models/model_widget/Nowplaying.dart';

class NowplayingManagement extends ChangeNotifier{
  List<Nowplaying> listNowplaying=[


    Nowplaying(
      Name: 'Doraemon movie 43',
      Time: '20.12.2022',
      Address: 'Adventure, Sci-fi',
      Star:'4.0',
      Image: 'img_2.jpg',
    ),
    Nowplaying(
      Name: 'Doraemon movie 77',
      Time: '20.12.2022',
      Address: 'Adventure, Sci-fi',
      Star:'4.0',
      Image: 'img_2.jpg',
    ),
    Nowplaying(
      Name: 'Doraemon movie 11',
      Time: '20.12.2022',
      Address: 'Adventure, Sci-fi',
      Star:'4.0',
      Image: 'img_2.jpg',
    ),
    Nowplaying(
      Name: 'Doraemon movie 20',
      Time: '20.12.2022',
      Address: 'Adventure, Sci-fi',
      Star:'4.0',
      Image: 'img_2.jpg',
    ),
  ];
}