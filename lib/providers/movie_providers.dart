import 'package:flutter/material.dart';
import 'package:movie_app_final/models/movie_model.dart';
import 'package:movie_app_final/services/api_services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Movieproviders extends ChangeNotifier {
  static const String urlApi = ApiService.urlApi;
  List<MovieModel> listAllMovie = [];

  void addListMovies() {
    for (var i in listMovies) {
      addMovie(i);
    }
  }

  Future<void> fetchAllMovies() async {
    try {
      final response = await http.get(
        Uri.parse('$urlApi/getAllMovies'),
      );

      if (response.statusCode == 200) {
        // Nếu thành công, chuyển đổi dữ liệu JSON thành danh sách các bộ phim
        List<dynamic> data = json.decode(response.body);
        //print(data);
        List<MovieModel> movies =
            data.map((json) => MovieModel.fromJson(json)).toList();
        listAllMovie = movies;
        printMovieModelProperties(listAllMovie[0]);
        notifyListeners(); // Thông báo cho các người nghe rằng danh sách phim đã được cập nhật
        //return movies;
      } else {
        // Nếu không thành công, thông báo lỗi cho người dùng
        throw Exception('Failed to load movies');
      }
    } catch (error) {
      // Nếu xảy ra lỗi trong quá trình gửi yêu cầu, thông báo lỗi cho người dùng
      throw Exception('Error loading movies: $error');
    }
  }

  Future<void> addMovie(MovieModel movieData) async {
    try {
      // Gửi yêu cầu POST đến API để thêm bộ phim mới
      final response = await http.post(
        Uri.parse('$urlApi/addMovie'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(movieData.toJson()),
      );

      // Kiểm tra mã trạng thái của phản hồi
      if (response.statusCode == 201) {
        // Nếu thành công, thông báo cho người dùng
        print('Movie added successfully');
      } else {
        // Nếu không thành công, thông báo lỗi cho người dùng
        print('Failed to add movie');
      }
    } catch (error) {
      // Nếu xảy ra lỗi trong quá trình gửi yêu cầu, thông báo lỗi cho người dùng
      print('Error adding movie: $error');
    }
  }

  Future<MovieModel> getMovieById(String movieId) async {
    final url = Uri.parse('$urlApi/getMovieById/$movieId');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        // Nếu thành công, chuyển đổi dữ liệu JSON thành Map
        final Map<String, dynamic> data = json.decode(response.body);
        return MovieModel.fromJson(data);
      } else if (response.statusCode == 404) {
        // Nếu không tìm thấy bộ phim, thông báo cho người dùng
        throw Exception('Movie not found');
      } else {
        // Nếu có lỗi, thông báo lỗi cho người dùng
        throw Exception('Failed to load movie: ${response.statusCode}');
      }
    } catch (error) {
      // Nếu xảy ra lỗi trong quá trình gửi yêu cầu, thông báo lỗi cho người dùng
      throw Exception('Error loading movie: $error');
    }
  }

  void printMovieModelProperties(MovieModel movie) {
    print('id: ${movie.id}');
    print('name: ${movie.name}');
    print('slug: ${movie.slug}');
    print('trailerUrl: ${movie.trailerUrl}');
    print('description: ${movie.description}');
    print('content: ${movie.content}');
    print('thumbnail: ${movie.thumbnail}');
    print('category: ${movie.category}');
    print('director: ${movie.director}');
    print('actor: ${movie.actor}');
    print('language: ${movie.language}');
    print('publish: ${movie.publish}');
    print('censorship: ${movie.censorship}');
    print('duration: ${movie.duration}');
    print('startTime: ${movie.startTime}');
    print('endTime: ${movie.endTime}');
    print('reviewPoint: ${movie.reviewPoint}');
    print('createdBy: ${movie.createdBy}');
    print('createdAt: ${movie.createdAt}');
  }

  List<MovieModel> listMovies = [
    MovieModel(
        name: "name",
        slug: "slug",
        trailerUrl: "https://www.youtube.com/watch?v=WLEhociPWzA",
        description: "description",
        content: "content",
        thumbnail: "images// nằm dọc",
        category: "category",
        director: "actorID",
        actor: "6622a046ae30f9d340778130, ",
        language: "language",
        publish: "publish",
        censorship: "censorship",
        duration: "duration",
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        reviewPoint: 4,
        createdBy: "Admin",
        createdAt: DateTime.now(),
        isWatching: false,
        videoUrl:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/videos%2Fkung-fu-panda-4-official-trailer.mp4?alt=media&token=53325b62-57d5-4fd9-bb05-17efbe7393ae",
        thumbnailLandscape: "images// nằm ngang")
  ];
}
