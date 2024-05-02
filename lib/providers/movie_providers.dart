// ignore_for_file: avoid_print

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_final/models/model_widget/seat.dart';
import 'package:movie_app_final/models/movie_model.dart';
import 'package:movie_app_final/models/seat_model.dart';
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

  Future<void> initSeats() async {
    for (var i in _listAllMovie) {
      int randomNumber = Random().nextInt(15) + 1;
      SeatModel seat = SeatModel(
          movieId: i.id ?? '', reserved: '', service: randomNumber.toString());
      await insertSeat(seat);
    }
  }

  // Phương thức để thêm một ghế mới
  Future<bool> insertSeat(SeatModel seat) async {
    try {
      final response = await http.post(
        Uri.parse('$urlApi/insertSeat'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(seat.toJson()),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  MovieModel? findMovieById(String movieId) {
    return _listAllMovie.firstWhereOrNull((element) => element.id == movieId);
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
    // MovieModel(
    //     name: "Mai",
    //     slug: "slug",
    //     trailerUrl: "https://www.youtube.com/watch?v=EX6clvId19s",
    //     description:
    //         "'Mai' is a story about Mai, a massage therapist with a special destiny. She frequently faces society's criticism and encounters Dương - a charming playboy, who ignites in her a longing for a new life. They share moments of freedom, passion, and laughter. Will they be able to hold onto that happiness for long when life's bitterness and injustice often prevail?",
    //     content: "content",
    //     thumbnail:
    //         "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhdoc%2FMai_2024_poster.jpg?alt=media&token=cc55c0b9-4831-40a2-ab15-f9839a80a77c",
    //     category: "Romance, Psychology",
    //     director: "actorID",
    //     actor: "actorID",
    //     language: "Vietnamese",
    //     publish: "publish",
    //     censorship: "18+",
    //     duration: "2h31",
    //     startTime: DateTime.now(),
    //     endTime: DateTime.now(),
    //     reviewPoint: 4,
    //     createdBy: "Admin",
    //     createdAt: DateTime.now(),
    //     isWatching: false,
    //     videoUrl:
    //         "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/videos%2Fkung-fu-panda-4-official-trailer.mp4?alt=media&token=53325b62-57d5-4fd9-bb05-17efbe7393ae",
    //     thumbnailLandscape:
    //         "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhngang%2Fmai.png?alt=media&token=bad20e9b-061a-46e4-af02-64e58c8cca14"),
    // MovieModel(
    //     name: "Đào, phở và piano",
    //     slug: "slug",
    //     trailerUrl: "https://www.youtube.com/watch?v=qn1t_biQigc",
    //     description:
    //         "Set against the backdrop of the 60-day-long battle of the spring of 1946 to early 1947 in Hanoi, the story follows the footsteps of the militia soldier Văn Dân and his love affair with the passionate zither player, Thục Hương. While others evacuate to the war zone, they decide to stay and defend the devastated capital city, despite the imminent dangers ahead.",
    //     content: "content",
    //     thumbnail:
    //         "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhdoc%2Fdaophopiano_poster.jpg?alt=media&token=7daacd7b-b6a2-41e7-b558-85c7202bc214",
    //     category: "Romantic, Epic",
    //     director: "actorID",
    //     actor: "actorID",
    //     language: "Vietnamese",
    //     publish: "publish",
    //     censorship: "13+",
    //     duration: "1h40",
    //     startTime: DateTime.now(),
    //     endTime: DateTime.now(),
    //     reviewPoint: 4,
    //     createdBy: "Admin",
    //     createdAt: DateTime.now(),
    //     isWatching: false,
    //     videoUrl:
    //         "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/videos%2FR%C3%B2%20R%E1%BB%89%20Trailer%20Phim%20%C4%90ang%20G%C3%A2y%20S%E1%BB%91t%20-%20%C4%90%C3%A0o%20Ph%E1%BB%9F%20V%C3%A0%20Piano.mp4?alt=media&token=4ac70fd4-667f-4056-ac51-4ecf3b29f807",
    //     thumbnailLandscape:
    //         "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhngang%2Fdao_pho_piano.png?alt=media&token=2a52a3d6-a4ef-458b-85c6-8a37af7276cb"),
    // MovieModel(
    //     name: "Gặp lại chị bầu",
    //     slug: "slug",
    //     trailerUrl: "https://www.youtube.com/watch?v=Gggw9jwr1h4",
    //     description:
    //         "A family romantic comedy filled with laughter for the Tet holiday of the Lunar New Year. 'Reunion with Sister Bầu' revolves around Phúc, a young member with a passion for acting but has to go through various hardships in life. He coincidentally ends up staying at Mrs. Lê's boarding house and experiences the most memorable days of his youth with the friends he meets there",
    //     content: "content",
    //     thumbnail:
    //         "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhdoc%2Fgaplaichibau_poster.jpg?alt=media&token=09a907b5-e6a9-491b-a78e-6f7c5d6eb6f5",
    //     category: "Romantic Comedy, Drama",
    //     director: "actorID",
    //     actor: "actorID",
    //     language: "Vietnamese",
    //     publish: "publish",
    //     censorship: "13+",
    //     duration: "1h54",
    //     startTime: DateTime.now(),
    //     endTime: DateTime.now(),
    //     reviewPoint: 4,
    //     createdBy: "Admin",
    //     createdAt: DateTime.now(),
    //     isWatching: false,
    //     videoUrl:
    //         "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/videos%2FG%E1%BA%B6P%20L%E1%BA%A0I%20CH%E1%BB%8A%20B%E1%BA%A6U%20-%20OFFICAL%20TRAILER%20_%20DKKC_%20M%C3%99NG%201%20T%E1%BA%BET%202024.mp4?alt=media&token=de201ac8-8f7a-47ff-bad1-0df2db3714c5",
    //     thumbnailLandscape:
    //         "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhngang%2Fgaplaichibau.png?alt=media&token=b1d4d94d-05c8-4727-a6fd-42150042cad1"),
    // MovieModel(
    //     name: "Godzilla x Kong: Đế chế mới",
    //     slug: "slug",
    //     trailerUrl: "https://www.youtube.com/watch?v=B2Jlyq_Tf3Y",
    //     description:
    //         "A family romantic comedy filled with laughter for the Tet holiday of the Lunar New Year. 'Reunion with Sister Bầu' revolves around Phúc, a young member with a passion for acting but has to go through various hardships in life. He coincidentally ends up staying at Mrs. Lê's boarding house and experiences the most memorable days of his youth with the friends he meets there",
    //     content: "content",
    //     thumbnail:
    //         "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhdoc%2Fkingkong_poster.jpg?alt=media&token=8cd637d1-0c36-49bb-85bc-83f386b8cbe1",
    //     category: "Monster",
    //     director: "actorID",
    //     actor: "actorID",
    //     language: "English",
    //     publish: "publish",
    //     censorship: "13+",
    //     duration: "1h55",
    //     startTime: DateTime.now(),
    //     endTime: DateTime.now(),
    //     reviewPoint: 4,
    //     createdBy: "Admin",
    //     createdAt: DateTime.now(),
    //     isWatching: false,
    //     videoUrl:
    //         "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/videos%2FG%E1%BA%B6P%20L%E1%BA%A0I%20CH%E1%BB%8A%20B%E1%BA%A6U%20-%20OFFICAL%20TRAILER%20_%20DKKC_%20M%C3%99NG%201%20T%E1%BA%BET%202024.mp4?alt=media&token=de201ac8-8f7a-47ff-bad1-0df2db3714c5",
    //     thumbnailLandscape:
    //         "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhngang%2Fgodzilla-kong.png?alt=media&token=9630498a-ad48-4d63-b13c-60d0138176c3"),
    // MovieModel(
    //     name: "EXHUMA: Quật mộ trùng ma",
    //     slug: "slug",
    //     trailerUrl: "https://www.youtube.com/watch?v=7LH-TIcPqks",
    //     description:
    //         "Two wizards, a feng shui master, and a forensic expert join forces to excavate the cursed tomb of a wealthy family, aiming to save the life of the last descendant in the lineage. The dark secrets of their ancestors are awakened.",
    //     content: "content",
    //     thumbnail:
    //         "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhdoc%2Fquatmotrungma_poster.jpg?alt=media&token=1a85c4ab-ec06-40d1-a6a7-7882f385fc13",
    //     category: "Horror, Detective",
    //     director: "actorID",
    //     actor: "actorID",
    //     language: "Korea",
    //     publish: "publish",
    //     censorship: "16+",
    //     duration: "2h14",
    //     startTime: DateTime.now(),
    //     endTime: DateTime.now(),
    //     reviewPoint: 4,
    //     createdBy: "Admin",
    //     createdAt: DateTime.now(),
    //     isWatching: false,
    //     videoUrl:
    //         "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/videos%2FQU%E1%BA%ACT%20M%E1%BB%98%20TR%C3%99NG%20MA%20-%20Teaser%20Trailer%20_%20KC_%2015.03.2024.mp4?alt=media&token=1bf8bd96-7419-4f97-b23f-7e47dc532a40",
    //     thumbnailLandscape:
    //         "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhngang%2Fquatmotrungma.png?alt=media&token=9f56c0c6-d6b6-4b90-b77d-6e49a80569bf"),

    MovieModel(
        name: "Cái giá của hạnh phúc",
        slug: "slug",
        trailerUrl: "https://www.youtube.com/watch?v=U46X1pXfolk",
        description:
            "The story revolves around the home of the businessman couple Đinh Công Thoại (played by Thái Hòa) and Võ Thùy Dương (played by Xuân Lan). On the surface, they have a wealthy and happy life, admired by many.",
        content:
            "Beneath their glamorous facade, Mrs. Dương and Mr. Thoại always strive to build an image of a successful and respectable family in the eyes of everyone. However, beneath this surface lies a tumultuous and troubled family with many hidden flaws.",
        thumbnail:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhdoc%2Fcai-gia-cua-hanh-phuc-poster.png?alt=media&token=fcfc2b30-7301-4623-ad28-4d44fc488ef5",
        category: "Psychology",
        director: "6622b094a48e47dcc7cb57d8",
        actor: "6622b094a48e47dcc7cb57d2",
        language: "Vietnamese",
        publish: "publish",
        censorship: "18+",
        duration: "1h55",
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        reviewPoint: 4,
        createdBy: "Admin",
        createdAt: DateTime.now(),
        isWatching: false,
        videoUrl:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/videos%2Fcai_gia_cua_hanh_phuc.mp4?alt=media&token=6e3700ae-889a-4dc7-bfb8-489e4f59e1ff",
        thumbnailLandscape:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhngang%2Fcai_gia_cua_hanh_phuc.png?alt=media&token=914b57a7-99b8-4eb1-ab77-6341fadaef2c"),

    MovieModel(
        name: "Mùa hè của Luca",
        slug: "slug",
        trailerUrl: "https://www.youtube.com/watch?v=FzV3gRevq4Q",
        description:
            "'Luca's Summer tells the story of young Luca's journey to the beautiful island of Portorosso, located in the Mediterranean Sea in Italy. Here, he meets and befriends new small friends and enjoys a sunny summer.",
        content:
            "'Mùa Hè Của Luca' tells the story of Luca's journey on the beautiful island of Portorosso in the Mediterranean Sea in Italy. Here, he makes friends and bonds with new small friends and enjoys a summer full of sunshine, Gelato ice cream, and the famous Italian pasta.",
        thumbnail:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhdoc%2Fmua_he_cua_luca.png?alt=media&token=7d920a70-946a-475b-b499-5af3932da4f9",
        category: "Comedy, Cartoon",
        director: "6622b094a48e47dcc7cb57d8",
        actor: "6622b094a48e47dcc7cb57d2",
        language: "English",
        publish: "publish",
        censorship: "13+",
        duration: "1h39",
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        reviewPoint: 4,
        createdBy: "Admin",
        createdAt: DateTime.now(),
        isWatching: false,
        videoUrl:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/videos%2FWatch%20Luca%20Full%20Movie.mp4?alt=media&token=8ef72ae1-9ac9-442a-8182-0697ecccc582",
        thumbnailLandscape:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhngang%2Fmua_he_cua_luca.png?alt=media&token=3f20a7e8-3ab1-42b2-9759-a46d0f3bc916"),

    MovieModel(
        name: "Anh hùng bàn phím",
        slug: "slug",
        trailerUrl: "https://www.youtube.com/watch?v=fX0pDW1PD94",
        description:
            "The movie delves deep into the hot topic of social manipulation through unethical tactics that has been rampant recently.",
        content:
            "Im Sang-jin - a social affairs reporter, was suspended from work after a biased investigative report about the controversies of the Manjun conglomerate. Thinking he had to bear the injustice for life, Im Sang-jin suddenly received anonymous information asserting that he was not wrong, but everything was manipulated by an online 'army'.",
        thumbnail:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhdoc%2Fposter-anh-hung-ban-phim.png?alt=media&token=a8bed1ed-1caf-475c-a2e4-6788cbd43b5e",
        category: "Criminal",
        director: "6622b094a48e47dcc7cb57d8",
        actor: "6622b094a48e47dcc7cb57d2",
        language: "Korea",
        publish: "publish",
        censorship: "16+",
        duration: "1h46",
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        reviewPoint: 4,
        createdBy: "Admin",
        createdAt: DateTime.now(),
        isWatching: false,
        videoUrl:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/videos%2FReview%20Anh%20H%C3%B9ng%20B%C3%A0n%20Ph%C3%ADm.mp4?alt=media&token=477177c4-5d72-4911-a5bb-3ff5c66389fa",
        thumbnailLandscape:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhngang%2Fanh_hung_ban_phim.png?alt=media&token=1af86104-2352-4bd4-ba0a-2f4ebd447b82"),

    MovieModel(
        name: "Thanh xuân 18x2: Lữ trình hướng về em",
        slug: "slug",
        trailerUrl: "https://www.youtube.com/watch?v=8Pq08VsVUFk",
        description:
            "That's the journey of Hua Quang Han searching for his first love in the movie 'Youth 18x2: Journey Back to You.' It's a journey back to the past, yet it makes people look forward to the future.",
        content:
            "Memories of first love flood back when Jimmy receives a postcard from Ami. He decides to board a train to Japan alone to reunite with the girl he missed 18 years ago. Will their youthful romance find a happy ending when they reunite?",
        thumbnail:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhdoc%2Fthanh-xuan-poster.png?alt=media&token=3ca38df6-033d-4094-aeaf-d97aee79dc24",
        category: "Romantic",
        director: "6622b094a48e47dcc7cb57d8",
        actor: "6622b094a48e47dcc7cb57d2",
        language: "China and Japan",
        publish: "publish",
        censorship: "13+",
        duration: "2h3",
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        reviewPoint: 4,
        createdBy: "Admin",
        createdAt: DateTime.now(),
        isWatching: false,
        videoUrl:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/videos%2FReview%20THANH%20XU%C3%82N%2018x2_%20L%E1%BB%AE%20TR%C3%8CNH%20H%C6%AF%E1%BB%9ANG%20V%E1%BB%80%20EM.mp4?alt=media&token=715f1580-3d4c-4399-98bb-2e777f314d4c",
        thumbnailLandscape:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhngang%2Fposter_thanh_xuan.png?alt=media&token=e878eace-121e-4bdc-b0c8-7cbe0cad7b91"),

    MovieModel(
        name: "Ngày tàn của đế quốc",
        slug: "slug",
        trailerUrl: "https://www.youtube.com/watch?v=QGlgPf9jGMA",
        description:
            "In the near future, a group of journalists is traveling across the United States during the Second American Civil War, which is rapidly escalating and plunging the country into chaos, between the U.S. government and the 'West Coast Forces.",
        content:
            "In a near future, a group of courageous war correspondents must struggle against time and dangerous bombs to reach the White House amidst the escalating civil war in the United States.",
        thumbnail:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhdoc%2FNgay-tan-cua-de-quoc-poster.png?alt=media&token=ce3d6fe2-5303-4596-b46b-0f429d85dcb3",
        category: "Science fiction",
        director: "6622b094a48e47dcc7cb57d8",
        actor: "6622b094a48e47dcc7cb57d2",
        language: "English",
        publish: "publish",
        censorship: "18+",
        duration: "1h49",
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        reviewPoint: 4,
        createdBy: "Admin",
        createdAt: DateTime.now(),
        isWatching: false,
        videoUrl:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/videos%2FREVIEW%20CIVIL%20WAR%20_%20NG%C3%80Y%20T%C3%80N%20C%E1%BB%A6A%20%C4%90%E1%BA%BE%20QU%E1%BB%90C.mp4?alt=media&token=e11cd267-e37d-47c0-b930-b907c4071dd8",
        thumbnailLandscape:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhngang%2FNgay-tan-cua-de-quoc.png?alt=media&token=13138b46-bd36-4e74-af37-594814b40fbb"),

    MovieModel(
        name: "Trạng quỳnh",
        slug: "slug",
        trailerUrl: "https://www.youtube.com/watch?v=ikXMNocYUeY",
        description: "A movie based on an iconic folk sotry - Trang Quynh",
        content:
            "'Trạng Quỳnh' will revolve around the journey to rescue Master Doan, as well as the life of Điềm, a conflicted and comical father, and the struggles of ordinary people in the feudal society oppressed by unjust officials.",
        thumbnail:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhdoc%2Fcai-gia-cua-hanh-phuc-poster.png?alt=media&token=fcfc2b30-7301-4623-ad28-4d44fc488ef5",
        category: "Science fiction",
        director: "6622b094a48e47dcc7cb57d8",
        actor: "6622b094a48e47dcc7cb57d2",
        language: "Vietnamese",
        publish: "publish",
        censorship: "13+",
        duration: "1h38",
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        reviewPoint: 4,
        createdBy: "Admin",
        createdAt: DateTime.now(),
        isWatching: false,
        videoUrl:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/videos%2Fnha-ba-nu.mp4?alt=media&token=186aa3b2-38db-4a6d-97f2-a77d0c610002",
        thumbnailLandscape:
            "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhngang%2Fcai_gia_cua_hanh_phuc.png?alt=media&token=914b57a7-99b8-4eb1-ab77-6341fadaef2c"),
  ];
}
