import 'package:flutter/material.dart';
import 'package:movie_app_final/models/movie.dart';
import '../models/user.dart';

class AuthProvider extends ChangeNotifier {
  List<User> list = [];

  User CurrentUser = User(
      id: "123",
      name: "Nghĩa Đần",
      phone: "+8412345678",
      mail: "NghiaDan@gmail.com");
}
