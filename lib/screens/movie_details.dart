import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_app_final/models/movie_model.dart';
import 'package:movie_app_final/providers/actor_providers.dart';
import 'package:movie_app_final/providers/movie_providers.dart';
import 'package:movie_app_final/providers/orders_provider.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/screens/select_seat_screen.dart';
import 'package:movie_app_final/widgets/Base/custom_actor.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';
import 'package:movie_app_final/widgets/Base/custom_popup.dart';
import 'package:movie_app_final/widgets/Base/custom_text_button.dart';
import 'package:provider/provider.dart';
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
    var dataActor = Provider.of<ActorProviders>(context, listen: false);
    late String movieId = ModalRoute.of(context)!.settings.arguments as String;
    movieId ??= "662672c978a71af977967c0f";

    MovieModel? movie = dataMovie.findMovieById(movieId);
    dataMovie.printMovieModelProperties(movie!);
    dataOrder.currentMovieId = movieId;

    double screenWidth = MediaQuery.of(context).size.width;
    dataActor.fetchActors();

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
                  child: Row(
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
  }) : super(key: key);

  final double screenWidth;
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
                const Row(
                  children: [
                    Expanded(
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
                        'Romance, psychology', // Chữ thêm vào
                        style: TextStyle(
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
                const Row(
                  children: [
                    Expanded(
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
                        '18+',
                        style: TextStyle(
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
                const Row(
                  children: [
                    Expanded(
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
                        'Vietnamese',
                        style: TextStyle(
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
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Storyline',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '"Mai" is the story of Mai, a masseuse with a special fate. She often faces criticism from society and her meeting with Duong - a flower boy, awakens in her a desire for a new life...',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal,
                      ),
                      softWrap: true,
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                        height: 5), // Khoảng cách giữa nội dung và "See more"
                    Text(
                      'See more',
                      style: TextStyle(
                        color: AppColors.BaseColorTextMain,
                        fontSize: 16,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
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
                    Container(
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
                              width: 50, // Đặt kích thước của hình ảnh tại đây
                              height: 50, // Đặt kích thước của hình ảnh tại đây
                              child: Image.asset(
                                'assets/images/tran-thanh.jpg',
                                fit: BoxFit.cover,
                              ), // Thay đổi đường dẫn hình ảnh tại đây
                            ),
                          ),
                          const SizedBox(
                              width:
                                  10), // Khoảng cách giữa hình ảnh và văn bản
                          const Align(
                            alignment: Alignment.center,
                            child: Text('Trấn Thành',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.normal,
                                )),
                          ),
                        ],
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
                                     actor.images, // Accessing actor's image property
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
                                SizedBox(height: 20),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                ChooseCinema(),
                SizedBox(
                  height: 20,
                ),
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

class TrailerScreen extends StatelessWidget {
  final String trailerUrl;
  static const routeName = '/trailer-screen';

  const TrailerScreen({Key? key, required this.trailerUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? videoId = YoutubePlayer.convertUrlToId(trailerUrl);
    if (videoId != null) {
      YoutubePlayerController controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      );

      return Scaffold(
        backgroundColor: AppColors.BaseColorBlackGround,
        appBar: AppBar(
          backgroundColor: Colors.transparent, // Transparent AppBar
          elevation: 0, // No shadow
          leading: IconButton(
            icon: Icon(Icons.close), // Close icon
            onPressed: () {
              Navigator.of(context).pop(); // Close the screen
            },
          ),
        ),
        body: Center(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: YoutubePlayer(
              controller: controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.amber,
              progressColors: ProgressBarColors(
                playedColor: Colors.amber,
                handleColor: Colors.amberAccent,
              ),
            ),
          ),
        ),
      );
    } else {
      // Xử lý khi không thể chuyển đổi trailer URL thành video ID
      print('Invalid trailer URL or unable to convert to video ID');
      return Scaffold(
        body: Center(
          child: Text('Invalid trailer URL or unable to convert to video ID'),
        ),
      );
    }
  }
}
