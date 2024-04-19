import 'package:flutter/material.dart';
import 'package:movie_app_final/models/actor.dart';

class ActorProviders extends ChangeNotifier {
  List<Actor> listActors = [
    Actor(
        name: "James Ali",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2F279314470_386984456637448_3437393956660238075_n.jpg?alt=media&token=395db439-a2c1-40b7-af0f-a7ad5904493a"),
    Actor(name: "alisdiufds", images: "images"),
    Actor(
        name: "Khoa Dan",
        images:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2FScreenshot%202023-04-12%20152726.png?alt=media&token=a0b93cec-a33e-49f4-8eea-411a378e3549")
  ];
  String linkytb = " https://www.youtube.com/watch?v=WLEhociPWzA";
  // download => xóa ube đi rồi chuyển sang mp4  download về.
  //https://www.yout.com/watch?v=WLEhociPWzA
}
