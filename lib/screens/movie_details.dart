import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_app_final/models/movie_model.dart';
import 'package:movie_app_final/providers/actor_providers.dart';
import 'package:movie_app_final/providers/movie_providers.dart';
import 'package:movie_app_final/providers/orders_provider.dart';
import 'package:movie_app_final/providers/rate_provider.dart';
import 'package:movie_app_final/providers/seats_provider.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/screens/bottom_sheet_rate.dart';
import 'package:movie_app_final/screens/select_seat_screen.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';
import 'package:movie_app_final/widgets/Base/custom_popup.dart';
import 'package:movie_app_final/widgets/Base/custom_text_button.dart';
import 'package:movie_app_final/widgets/bottom_sheet_rate_widget.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../models/actor.dart';
import '../widgets/Base/custom_cinema_movie_detail.dart';

class MoviedetailsScreens extends StatelessWidget {
  const MoviedetailsScreens({Key? key}) : super(key: key);
  static const routeName = '/movie-details-screen';

  @override
  Widget build(BuildContext context) {
    var dataMovie = Provider.of<Movieproviders>(context);
    var dataOrder = Provider.of<OrdersProvider>(context, listen: false);
    var dataSeat = Provider.of<SeatsProviders>(context);
    var dataActor = Provider.of<ActorProviders>(context, listen: false);
    //var dataRate = Provider.of<RateProvider>(context, listen: false);
    late String movieId = ModalRoute.of(context)!.settings.arguments as String;
    movieId ??= "662672c978a71af977967c0f";

    MovieModel? movie = dataMovie.findMovieById(movieId);
    dataMovie.printMovieModelProperties(movie!);
    dataOrder.currentMovieId = movieId;

    dataOrder.getSection();
    dataSeat.currentMovieId = movieId;
    dataSeat.InitSeatResrved();
    //dataSeat.updatemMovieId(movieId);
    //dataRate.fetchListratesOfMovie(movieId);

    double screenWidth = MediaQuery.of(context).size.width;
    //dataActor.fetchActors();

    return Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    Image.network(
                      movie.thumbnailLandscape,
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 150),
                    MainContent(
                      screenWidth: screenWidth,
                      actors: dataActor.actors,
                      movie: movie,
                    ),
                  ],
                ),
                Positioned(
                    top: 220,
                    left: 17,
                    right: 17,
                    child: PositionedItem(
                      screenWidth: screenWidth,
                      movie: movie,
                    ))
              ],
            ),
          ),
          const Positioned(
            top: 0,
            left: 10,
            right: 0,
            child: CustomAppBar(),
          ),
        ],
      ),
    );
  }
}

class PositionedItem extends StatelessWidget {
  const PositionedItem({
    Key? key,
    required this.screenWidth,
    required this.movie,
  }) : super(key: key);

  final double screenWidth;
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: screenWidth - 40,
      height: 240,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.BaseColorAroundBlack,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            movie.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                decoration: TextDecoration.none,
                fontSize: 25,
                color: AppColors.BaseColorWhite,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "${movie.duration}* ${MovieModel.getFormattedDate(movie.createdAt)}",
            style: const TextStyle(
                color: AppColors.BaseColorAroundWhite,
                fontSize: 15,
                decoration: TextDecoration.none),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              const Text(
                'Review',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: AppColors.BaseColorWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              const Icon(
                Iconsax.star5,
                color: AppColors.BaseColorMain,
              ),
              Text(
                "${movie.reviewPoint} (1.222)",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                    color: AppColors.BaseColorWhite,
                    fontSize: 17,
                    decoration: TextDecoration.none),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 30,
                    color: AppColors.BaseColorMain,
                  ),
                  Icon(
                    Icons.star,
                    size: 30,
                    color: AppColors.BaseColorMain,
                  ),
                  Icon(
                    Icons.star,
                    size: 30,
                    color: AppColors.BaseColorMain,
                  ),
                  Icon(
                    Icons.star,
                    size: 30,
                    color: AppColors.BaseColorMain,
                  ),
                  Icon(
                    Icons.star,
                    size: 30,
                    color: Colors.grey,
                  ),
                ],
              ),
              InkWell(
                // Inside the onTap handler of the "Watch Trailer" button
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          TrailerScreen(trailerUrl: movie.trailerUrl),
                    ),
                  );
                },

                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColors.BaseColorWhite)),
                  padding: const EdgeInsets.all(10),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.play_circle,
                        size: 20,
                        color: AppColors.BaseColorMain,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Watch Trailer",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: AppColors.BaseColorWhite,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    Key? key,
    required this.screenWidth,
    required this.actors,
    required this.movie,
  }) : super(key: key);

  final double screenWidth;
  final MovieModel movie;
  final List<Actor> actors;

  @override
  Widget build(BuildContext context) {
    var dataOrder = Provider.of<OrdersProvider>(context);
    //final Actor actor;
    // var dataActor = Provider.of<ActorProviders>(context, listen: false);
    // List<Actor> allActors = dataActor.actors;
    // var uSedActors=dataActor.actors.where((actor) => actor.isUsed);
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Movie genre:',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        movie.category, // Chữ thêm vào
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Censorship:',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        movie.censorship,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Language:',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        movie.language,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Storyline',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ReadMoreText(
                      movie.description,
                      trimLines: 4,
                      colorClickableText: AppColors.BaseColorTextMain,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'see more!',
                      trimExpandedText: 'hide!',
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.BaseColorWhite,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                      moreStyle: const TextStyle(
                        fontSize: 16,
                        color: AppColors.BaseColorTextMain,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Director',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ItemActor(
                      actorId: movie.director,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Actor',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: actors.map((actor) {
                          return Container(
                            constraints: const BoxConstraints(
                              maxWidth: 200,
                              maxHeight: 70,
                            ),
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade900,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    child: Image.network(
                                      // 'assets/images/tran-thanh.jpg',
                                      actor
                                          .images, // Accessing actor's image property
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      actor
                                          .name, // Accessing actor's name property
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return BottomSheetRateMovie(
                          movieId: movie.id!,
                        );
                      },
                    );
                  },
                  child: RateMovieWidget(
                    movieId: movie.id!,
                  ),
                ),
                const SizedBox(height: 20),
                const ChooseCinema(),
                const SizedBox(height: 20),
                CustomTextButton(
                    text: 'Continue',
                    onPressed: () {
                      if (dataOrder.currentSelectedCinema == -1) {
                        CustomDialogHelper.showCustomDialog(
                            context, "Please Select Cinema!", "cinema.svg");
                        return;
                      }
                      Navigator.pushNamed(context, SelectSeatScreen.routeName);
                    }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ItemActor extends StatelessWidget {
  const ItemActor({
    super.key,
    required this.actorId,
  });

  final String actorId;

  @override
  Widget build(BuildContext context) {
    final dataActor = Provider.of<ActorProviders>(context);
    final listAllActor = dataActor.actors;
    print("ACCCCCCC" + actorId);

    var director = listAllActor.firstWhereOrNull((x) => x.id == actorId);

    director ??= listAllActor.first;

    return Container(
      width: 200,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
                100), // Bo tròn hình ảnh theo đường viền của Container
            child: Container(
              width: 50,
              height: 50,
              // ignore: unnecessary_null_comparison
              child: director!.images != null
                  ? Image.network(
                      director.images,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/images/tran-thanh.jpg',
                      fit: BoxFit.cover,
                    ), // Thay đổi đường dẫn hình ảnh tại đây
            ),
          ),
          const SizedBox(width: 10), // Khoảng cách giữa hình ảnh và văn bản
          Align(
            alignment: Alignment.center,
            child: Text(director.name ?? 'Trấn Thành',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.normal,
                )),
          ),
        ],
      ),
    );
  }
}

class TrailerScreen extends StatelessWidget {
  final String trailerUrl;
  static const routeName = '/trailer-screen';

  const TrailerScreen({Key? key, required this.trailerUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? videoId = YoutubePlayer.convertUrlToId(trailerUrl);
    if (videoId != null) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      YoutubePlayerController controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      );

      return Scaffold(
          backgroundColor: AppColors.BaseColorBlackGround,
          // ignore: deprecated_member_use
          body: WillPopScope(
            onWillPop: () async {
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitUp,
                DeviceOrientation.portraitUp,
              ]);
              return true;
            },
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(children: [
                Center(
                    child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: YoutubePlayer(
                    controller: controller,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: AppColors.BaseColorMain,
                    progressColors: const ProgressBarColors(
                      playedColor: AppColors.BaseColorMain,
                      handleColor: AppColors.BaseColorMain,
                    ),
                  ),
                )),
                Positioned(
                  right: 10,
                  top: 0,
                  left: 0,
                  child: CustomAppBar(
                    showBackButton: false,
                    iconRightButton: Icons.close,
                    onPressedRight: () {
                      SystemChrome.setPreferredOrientations([
                        DeviceOrientation.portraitUp,
                        DeviceOrientation.portraitUp,
                      ]);
                      Navigator.pop(context);
                    },
                  ),
                )
              ]),
            ),
          ));
    } else {
      // Xử lý khi không thể chuyển đổi trailer URL thành video ID
      print('Invalid trailer URL or unable to convert to video ID');
      return const Scaffold(
        body: Center(
          child: Text('Invalid trailer URL or unable to convert to video ID'),
        ),
      );
    }
  }
}
