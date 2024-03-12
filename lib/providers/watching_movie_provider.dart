import 'package:flutter/material.dart';
import 'package:movie_app_final/models/model_widget/movie.dart';

class WatchingMovieProvider extends ChangeNotifier {
  List<Movie> listCarousel = [Movie(imageUrl: "123", name: "Mai")];
}
