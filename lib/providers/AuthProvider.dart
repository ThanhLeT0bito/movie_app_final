import 'package:flutter/material.dart';
import 'package:movie_app_final/models/model_widget/movie.dart';
import '../models/model_widget/user.dart';

class AuthProvider extends ChangeNotifier {
  List<User> list = [];

  User CurrentUser = User(id: "123", name: "Nghĩa Đần", phone: "+8412345678", mail: "NghiaDan@gmail.com");
}
