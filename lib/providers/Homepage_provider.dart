import 'package:flutter/material.dart';
import 'package:movie_app_final/models/model_widget/Homepage.dart';

class HomepageManagement extends ChangeNotifier {
  List<Homepage> listCarousel = [
    Homepage(Image_Nowplaying: 'img_3.jpg'),
    Homepage(Image_Nowplaying: 'img_1.jpg'),
    Homepage(Image_Nowplaying: 'img_2.jpg'),
    Homepage(Image_Nowplaying: 'img_3.jpg'),
    Homepage(Image_Nowplaying: 'img_3.jpg'),
  ];
}
