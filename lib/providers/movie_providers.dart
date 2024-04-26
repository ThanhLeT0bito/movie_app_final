// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:movie_app_final/models/movie_model.dart';
import 'package:movie_app_final/services/api_services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:movie_app_final/widgets/item_carousel_widget.dart';

class Movieproviders extends ChangeNotifier {
  static const String urlApi = ApiService.urlApi;
  List<MovieModel> _listAllMovie = [];

  List<MovieModel> get listAllMovie => _listAllMovie;

  List<ItemCarouselWidget> _listCarousel = [];

  List<ItemCarouselWidget> get listCarousel => _listCarousel;

  Movieproviders() {
    initData();
  }

  void initData() {
    //fetchAllMovies();
    InitListCarousel();
  }

  void addListMovies() {
    for (var i in listMovies) {
      addMovie(i);
    }
  }

  MovieModel findMovieById(String movieId) {
    return _listAllMovie.firstWhere((element) => element.id == movieId);
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
        _listAllMovie = movies;
        //printMovieModelProperties(listAllMovie[0]);
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

  Future<void> InitListCarousel() async {
    await fetchAllMovies();

    for (int i = 0; i < 4; i++) {
      ItemCarouselWidget newCar = ItemCarouselWidget(
        id: listAllMovie[i].id!,
        img: listAllMovie[i].thumbnail,
        name: listAllMovie[i].name,
        description: listAllMovie[i].category,
      );
      _listCarousel.add(newCar);
    }
    notifyListeners();
    print(_listCarousel.length);
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
        name: "Mai",
        slug: "slug",
        trailerUrl: "https://www.youtube.com/watch?v=EX6clvId19s",
        description:
            "'Mai' is a story about Mai, a massage therapist with a special destiny. She frequently faces society's criticism and encounters Dương - a charming playboy, who ignites in her a longing for a new life. They share moments of freedom, passion, and laughter. Will they be able to hold onto that happiness for long when life's bitterness and injustice often prevail?",
        content: "content",
        thumbnail:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhdoc%2FMai_2024_poster.jpg?alt=media&token=cc55c0b9-4831-40a2-ab15-f9839a80a77c",
        category: "Romance, Psychology",
        director: "actorID",
        actor: "actorID",
        language: "Vietnamese",
        publish: "publish",
        censorship: "18+",
        duration: "2h31",
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        reviewPoint: 4,
        createdBy: "Admin",
        createdAt: DateTime.now(),
        isWatching: false,
        videoUrl:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/videos%2Fkung-fu-panda-4-official-trailer.mp4?alt=media&token=53325b62-57d5-4fd9-bb05-17efbe7393ae",
        thumbnailLandscape:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhngang%2Fmai.png?alt=media&token=bad20e9b-061a-46e4-af02-64e58c8cca14"),
    MovieModel(
        name: "Đào, phở và piano",
        slug: "slug",
        trailerUrl: "https://www.youtube.com/watch?v=qn1t_biQigc",
        description:
            "Set against the backdrop of the 60-day-long battle of the spring of 1946 to early 1947 in Hanoi, the story follows the footsteps of the militia soldier Văn Dân and his love affair with the passionate zither player, Thục Hương. While others evacuate to the war zone, they decide to stay and defend the devastated capital city, despite the imminent dangers ahead.",
        content: "content",
        thumbnail:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhdoc%2Fdaophopiano_poster.jpg?alt=media&token=7daacd7b-b6a2-41e7-b558-85c7202bc214",
        category: "Romantic, Epic",
        director: "actorID",
        actor: "actorID",
        language: "Vietnamese",
        publish: "publish",
        censorship: "13+",
        duration: "1h40",
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        reviewPoint: 4,
        createdBy: "Admin",
        createdAt: DateTime.now(),
        isWatching: false,
        videoUrl:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/videos%2FR%C3%B2%20R%E1%BB%89%20Trailer%20Phim%20%C4%90ang%20G%C3%A2y%20S%E1%BB%91t%20-%20%C4%90%C3%A0o%20Ph%E1%BB%9F%20V%C3%A0%20Piano.mp4?alt=media&token=4ac70fd4-667f-4056-ac51-4ecf3b29f807",
        thumbnailLandscape:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhngang%2Fdao_pho_piano.png?alt=media&token=2a52a3d6-a4ef-458b-85c6-8a37af7276cb"),
    MovieModel(
        name: "Gặp lại chị bầu",
        slug: "slug",
        trailerUrl: "https://www.youtube.com/watch?v=Gggw9jwr1h4",
        description:
            "A family romantic comedy filled with laughter for the Tet holiday of the Lunar New Year. 'Reunion with Sister Bầu' revolves around Phúc, a young member with a passion for acting but has to go through various hardships in life. He coincidentally ends up staying at Mrs. Lê's boarding house and experiences the most memorable days of his youth with the friends he meets there",
        content: "content",
        thumbnail:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhdoc%2Fgaplaichibau_poster.jpg?alt=media&token=09a907b5-e6a9-491b-a78e-6f7c5d6eb6f5",
        category: "Romantic Comedy, Drama",
        director: "actorID",
        actor: "actorID",
        language: "Vietnamese",
        publish: "publish",
        censorship: "13+",
        duration: "1h54",
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        reviewPoint: 4,
        createdBy: "Admin",
        createdAt: DateTime.now(),
        isWatching: false,
        videoUrl:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/videos%2FG%E1%BA%B6P%20L%E1%BA%A0I%20CH%E1%BB%8A%20B%E1%BA%A6U%20-%20OFFICAL%20TRAILER%20_%20DKKC_%20M%C3%99NG%201%20T%E1%BA%BET%202024.mp4?alt=media&token=de201ac8-8f7a-47ff-bad1-0df2db3714c5",
        thumbnailLandscape:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhngang%2Fgaplaichibau.png?alt=media&token=b1d4d94d-05c8-4727-a6fd-42150042cad1"),
    MovieModel(
        name: "Godzilla x Kong: Đế chế mới",
        slug: "slug",
        trailerUrl: "https://www.youtube.com/watch?v=B2Jlyq_Tf3Y",
        description:
            "A family romantic comedy filled with laughter for the Tet holiday of the Lunar New Year. 'Reunion with Sister Bầu' revolves around Phúc, a young member with a passion for acting but has to go through various hardships in life. He coincidentally ends up staying at Mrs. Lê's boarding house and experiences the most memorable days of his youth with the friends he meets there",
        content: "content",
        thumbnail:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhdoc%2Fkingkong_poster.jpg?alt=media&token=8cd637d1-0c36-49bb-85bc-83f386b8cbe1",
        category: "Monster",
        director: "actorID",
        actor: "actorID",
        language: "English",
        publish: "publish",
        censorship: "13+",
        duration: "1h55",
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        reviewPoint: 4,
        createdBy: "Admin",
        createdAt: DateTime.now(),
        isWatching: false,
        videoUrl:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/videos%2FG%E1%BA%B6P%20L%E1%BA%A0I%20CH%E1%BB%8A%20B%E1%BA%A6U%20-%20OFFICAL%20TRAILER%20_%20DKKC_%20M%C3%99NG%201%20T%E1%BA%BET%202024.mp4?alt=media&token=de201ac8-8f7a-47ff-bad1-0df2db3714c5",
        thumbnailLandscape:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhngang%2Fgodzilla-kong.png?alt=media&token=9630498a-ad48-4d63-b13c-60d0138176c3"),
    MovieModel(
        name: "EXHUMA: Quật mộ trùng ma",
        slug: "slug",
        trailerUrl: "https://www.youtube.com/watch?v=7LH-TIcPqks",
        description:
            "Two wizards, a feng shui master, and a forensic expert join forces to excavate the cursed tomb of a wealthy family, aiming to save the life of the last descendant in the lineage. The dark secrets of their ancestors are awakened.",
        content: "content",
        thumbnail:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhdoc%2Fquatmotrungma_poster.jpg?alt=media&token=1a85c4ab-ec06-40d1-a6a7-7882f385fc13",
        category: "Horror, Detective",
        director: "actorID",
        actor: "actorID",
        language: "Korea",
        publish: "publish",
        censorship: "16+",
        duration: "2h14",
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        reviewPoint: 4,
        createdBy: "Admin",
        createdAt: DateTime.now(),
        isWatching: false,
        videoUrl:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/videos%2FQU%E1%BA%ACT%20M%E1%BB%98%20TR%C3%99NG%20MA%20-%20Teaser%20Trailer%20_%20KC_%2015.03.2024.mp4?alt=media&token=1bf8bd96-7419-4f97-b23f-7e47dc532a40",
        thumbnailLandscape:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhngang%2Fquatmotrungma.png?alt=media&token=9f56c0c6-d6b6-4b90-b77d-6e49a80569bf"),
  ];
}
