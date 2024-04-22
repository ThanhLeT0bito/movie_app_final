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
        name: "Mai",
        slug: "slug",
        trailerUrl: "https://www.youtube.com/watch?v=EX6clvId19s",
        description:
        "'Mai' is a story about Mai, a massage therapist with a special destiny. She frequently faces society's criticism and encounters Dương - a charming playboy, who ignites in her a longing for a new life. They share moments of freedom, passion, and laughter. Will they be able to hold onto that happiness for long when life's bitterness and injustice often prevail?",
        content: "content",
        thumbnail:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhdoc%2FMai_2024_poster.jpg?alt=media&token=cc55c0b9-4831-40a2-ab15-f9839a80a77c",
        category: "Romance, Psychology",
        director: "6625325edf4726c5a03a99b1",
        actor: "6625325edf4726c5a03a99b3",
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
        director: "6622b094a48e47dcc7cb57dc",
        actor: "6622b094a48e47dcc7cb57de",
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
        director: "6625325edf4726c5a03a99bf",
        actor: "6625325edf4726c5a03a99bd",
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
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/videos%2Fgodzilla-x-kong-the-new-empire-official-trailer.mp4?alt=media&token=58d96e1f-b4b5-4886-8c71-e53e61e17729",
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
        director: "6622b094a48e47dcc7cb57d8",
        actor: "6622b094a48e47dcc7cb57d2",
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

    MovieModel(
        name: "DORAEMON: NOBITA VÀ BẢN GIAO HƯỞNG ĐỊA CẦU",
        slug: "slug",
        trailerUrl: "https://www.youtube.com/watch?v=-su6eKeETzg",
        description:
        "Doraemon: Nobita and the Earth's Symphony' is the 43rd animated feature film in the Doraemon series. Directed by Imai Kazuaki, who also directed the previous two films 'Nobita and the Island of Miracles' and 'Nobita's New Dinosaur.' Utsumi Teruko will be responsible for the screenplay of the film.",
        content: "Preparing for a concert at school, Nobita is practicing playing the flute – an instrument at which he is not very skilled. Fascinated by Nobita's quirky 'No' note, Micca – a mysterious girl, invites Doraemon, Nobita, and their friends to 'Farre' – the Music Palace located on a planet where music can be converted into energy. To save this palace, Micca is searching for a 'virtuoso' – a music master to perform with her! With the magical gadget 'musician certification', Doraemon and his friends choose musical instruments and join Micca in harmony, step by step restoring the palace.",
        thumbnail:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhdoc%2Fdoraemon43.png?alt=media&token=1b472918-008c-424f-a9ce-3c7695c968c2",
        category: "Cartoon",
        director: "6622b094a48e47dcc7cb57d8",
        actor: "6622b094a48e47dcc7cb57d2",
        language: "Japan",
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
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/videos%2Fdoraemon43.mp4?alt=media&token=5749471d-23a2-4b5b-a406-69abac297786",
        thumbnailLandscape:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhngang%2Fdoraemon-va-ban-giao-huong-dia-cau.png?alt=media&token=3992a32f-82f4-4dbd-aecd-a4b3ec1bce0b"),

    MovieModel(
        name: "Bố Già",
        slug: "slug",
        trailerUrl: "https://www.youtube.com/watch?v=jluSu8Rw6YE",
        description:
        "Set in Ho Chi Minh City, the film revolves around the relationship between Mr. Sang, a man who always worries about financial matters and helps others, and his son, Quắn.",
        content: "The movie will revolve around the daily lives of a poor working-class neighborhood, where the four brothers, Giàu, Sang, Phú, and Quý, with Ba Sang as the main character, worry about money but deeply care for their children. The story focuses on the relationship between Ba Sang (Trấn Thành) and Quắn (Tuấn Trần)",
        thumbnail:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhdoc%2Fbogia.png?alt=media&token=ebcbae7f-d6f3-4461-a0c5-9e04baa40702",
        category: "Family, Comedy",
        director: "6622b094a48e47dcc7cb57d8",
        actor: "6622b094a48e47dcc7cb57d2",
        language: "Vietnamese",
        publish: "publish",
        censorship: "13+",
        duration: "2h8",
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        reviewPoint: 4,
        createdBy: "Admin",
        createdAt: DateTime.now(),
        isWatching: false,
        videoUrl:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/videos%2Fbo_gia.mp4?alt=media&token=7c89cb22-bffc-4721-91c4-144b6b7e19bc",
        thumbnailLandscape:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhngang%2Fposter-phim-bo-gia.png?alt=media&token=829dc66a-fb70-4e13-a822-6fdccfe8af98"),

    MovieModel(
        name: "Kungfupanda",
        slug: "slug",
        trailerUrl: "https://www.youtube.com/watch?v=egkeFvm26pc",
        description:
        "'Kung Fu Panda 4' is an American animated martial arts comedy film released in 2024, produced by DreamWorks Animation and distributed by Universal Pictures.",
        content: "After Po is chosen to become the spiritual leader of the Valley of Peace, he needs to find and train a new Dragon Warrior, while an evil witch plans to summon all the defeated villains that Po has faced back to the spirit realm.",
        thumbnail:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhdoc%2FKung_Fu_Panda_4_poster.png?alt=media&token=35ce6758-7b6b-4e93-b423-2f0a0e295b3c",
        category: "Cartoon",
        director: "6622b094a48e47dcc7cb57d8",
        actor: "6622b094a48e47dcc7cb57d2",
        language: "English",
        publish: "publish",
        censorship: "13+",
        duration: "1h34",
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        reviewPoint: 4,
        createdBy: "Admin",
        createdAt: DateTime.now(),
        isWatching: false,
        videoUrl:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/videos%2Fkung-fu-panda-4-official-trailer.mp4?alt=media&token=53325b62-57d5-4fd9-bb05-17efbe7393ae",
        thumbnailLandscape:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhngang%2Fkung-fu-panda-4.png?alt=media&token=1dbcd03b-43ab-478e-a843-76a7f143f4b8"),

    MovieModel(
        name: "Quỷ Cẩu",
        slug: "slug",
        trailerUrl: "https://www.youtube.com/watch?v=cYCOcxWgPVU&pp=ygUTdHJhaWxlciBxdeG7tyBj4bqpdQ%3D%3D",
        description:
        "'Quỷ Cẩu' is inspired by the supernatural legend of the 'Chó Đội Nón Mê' (The Hat-Wearing Dog). According to this legend, during bright moonlit nights, the demon dogs would stand upright, walk on two legs, and incite evil spirits to disturb homeowners, causing strange occurrences.",
        content: "Nam returns to his hometown to arrange his father's funeral after his horrifying death, all while hiding his pregnant girlfriend. Nam dreams of his family being killed after his father's funeral, and Mít – the family's white dog – behaves strangely. Mr. Quyết, Mrs. Thúy, and Mrs. Liễu believe in the shaman, while Nam suspects the family's traditional dog slaughterhouse and investigates to solve the strange events unfolding.",
        thumbnail:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhdoc%2Fposter_quy_cau.png?alt=media&token=af692f6c-a561-45f0-9576-a337d070c6cd",
        category: "Horror",
        director: "6622b094a48e47dcc7cb57d8",
        actor: "6622b094a48e47dcc7cb57d2",
        language: "Vietnamese",
        publish: "publish",
        censorship: "18+",
        duration: "1h39",
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        reviewPoint: 4,
        createdBy: "Admin",
        createdAt: DateTime.now(),
        isWatching: false,
        videoUrl:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/videos%2Fquy_cau.mp4?alt=media&token=b477c1ea-bd36-4a16-b8ab-b5d337817368",
        thumbnailLandscape:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhngang%2Fquy_cau.png?alt=media&token=c0da0138-129a-4040-befd-5fea98d7787b"),

    MovieModel(
        name: "Mắt Biếc",
        slug: "slug",
        trailerUrl: "https://www.youtube.com/watch?v=ITlQ0oU7tDA",
        description:
        "Navigating through hardships and betrayal, Ngan's unrequited love for her childhood friend, Ha Lan, spans an entire generation in this deeply romantic film.",
        content: "As she ventured into the bustling city, the boy, from afar, remained lonely..., Ha Lan went to the city to study and was quickly consumed by the extravagant urban lifestyle, forgetting about Do Do. She forgot her childhood friend and chased after the charming playboy Dung. And then...",
        thumbnail:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhdoc%2Fmat_biec.png?alt=media&token=57d3c89c-383d-43a5-8e7c-7e9c8cc0d36b",
        category: "Romantic",
        director: "6622b094a48e47dcc7cb57d8",
        actor: "6622b094a48e47dcc7cb57d2",
        language: "Vietnamese",
        publish: "publish",
        censorship: "13+",
        duration: "1h57",
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        reviewPoint: 4,
        createdBy: "Admin",
        createdAt: DateTime.now(),
        isWatching: false,
        videoUrl:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/videos%2FQU%E1%BA%ACT%20M%E1%BB%98%20TR%C3%99NG%20MA%20-%20Teaser%20Trailer%20_%20KC_%2015.03.2024.mp4?alt=media&token=1bf8bd96-7419-4f97-b23f-7e47dc532a40",
        thumbnailLandscape:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhngang%2Fposter_mat_biec.png?alt=media&token=7ca73c1e-ce52-423d-9291-1d83a1f9b79f"),

    MovieModel(
        name: "Tiệc Trăng máu",
        slug: "slug",
        trailerUrl: "https://www.youtube.com/watch?v=nh0BklwPN9Q",
        description:
        "Tiệc Trăng Máu is a Vietnamese psychological drama film..",
        content: "During a group gathering of close friends, one member suddenly proposes a game of sharing their phones to enhance the spirit of ",
        thumbnail:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhdoc%2FTiec_trang_mau_poster.png?alt=media&token=66c88866-130e-40bb-80c6-38da9224749a",
        category: "Comedy, psychology",
        director: "6622b094a48e47dcc7cb57d8",
        actor: "6622b094a48e47dcc7cb57d2",
        language: "Vietnamese",
        publish: "publish",
        censorship: "18+",
        duration: "1h59",
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        reviewPoint: 4,
        createdBy: "Admin",
        createdAt: DateTime.now(),
        isWatching: false,
        videoUrl:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/videos%2Ftiectrangmau.mp4?alt=media&token=40134cf5-60e6-44f8-99f2-905ea729a342",
        thumbnailLandscape:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhngang%2Ftiec_trang_mau.png?alt=media&token=782fa865-168a-4c8b-8ca7-47daeeff7dba"),

    MovieModel(
        name: "Nhà bà nữ",
        slug: "slug",
        trailerUrl: "https://www.youtube.com/watch?v=IkaP0KJWTsQ",
        description:
        "Released on the first day of the Lunar New Year, 'Nhà bà Nữ' is a film that bears the hallmark of Trấn Thành.",
        content: "The film revolves around the family of Mrs. Nữ (played by artist Lê Giang) - a woman who sells noodle soup for a living. The story depicts the complex and multidimensional relationships among the family members.",
        thumbnail:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhdoc%2Fnha-ba-nu.png?alt=media&token=757da1c9-cf20-4fcb-b787-93b84868fd67",
        category: "Comedy, Family",
        director: "6622b094a48e47dcc7cb57d8",
        actor: "6622b094a48e47dcc7cb57d2",
        language: "Vietnamese",
        publish: "publish",
        censorship: "16+",
        duration: "1h42",
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        reviewPoint: 4,
        createdBy: "Admin",
        createdAt: DateTime.now(),
        isWatching: false,
        videoUrl:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/videos%2Fnha-ba-nu.mp4?alt=media&token=186aa3b2-38db-4a6d-97f2-a77d0c610002",
        thumbnailLandscape:
        "https://firebasestorage.googleapis.com/v0/b/movie-app-e8f16.appspot.com/o/images%2Fmovie%2Fanhngang%2Fnhabanu.png?alt=media&token=bf010e2b-0ca2-4ad7-b05f-2f89c6930699"),

  ];
}
