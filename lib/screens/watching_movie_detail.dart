import 'dart:async';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_app_final/models/actor.dart';
import 'package:movie_app_final/models/data_local/UserPreferences%20.dart';
import 'package:movie_app_final/models/movie_model.dart';
import 'package:movie_app_final/models/review_model.dart';
import 'package:movie_app_final/providers/AuthProvider.dart';
import 'package:movie_app_final/providers/actor_providers.dart';
import 'package:movie_app_final/providers/movie_providers.dart';
import 'package:movie_app_final/providers/review_provider.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/resources/converter.dart';
import 'package:movie_app_final/resources/dimens.dart';
import 'package:movie_app_final/screens/select_seat_screen.dart';
import 'package:movie_app_final/screens/show_video.dart';
import 'package:movie_app_final/widgets/Base/custom_app_bar.dart';
import 'package:movie_app_final/widgets/Base/custom_text_button.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import '../widgets/Base/custom_bottom_navigator.dart';
import '../widgets/Base/custom_item_radio.dart';
import '../widgets/custom_item_bottom__bar.dart';
import '../widgets/episode_widget.dart';
import '../widgets/movie_widget.dart';
import '../widgets/trailer_widget.dart';
import 'bottom_sheet_comment.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class WatchingDetailsScreens extends StatefulWidget {
  const WatchingDetailsScreens({Key? key}) : super(key: key);
  static const routeName = '/watching-details-screen';

  @override
  State<WatchingDetailsScreens> createState() => _WatchingDetailsScreensState();
}

class _WatchingDetailsScreensState extends State<WatchingDetailsScreens> {
  int _selectedIndex = 0;
  late List<CustomItemBottomBar> bottomNavBarItems;
  int indexHeaderWatching = 0;

  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    indexHeaderWatching = 0;
    void _playVideo() {
      setState(() {
        _isPlaying = true;
      });
    }

    ///Item bottom navigation
    bottomNavBarItems = [
      CustomItemBottomBar(
        icon: Iconsax.heart,
        label: "Love",
        isSelected: _selectedIndex == 0,
      ),
      CustomItemBottomBar(
        icon: Icons.file_download_outlined,
        label: "Download",
        isSelected: _selectedIndex == 1,
      ),
      CustomItemBottomBar(
        icon: Icons.share,
        label: "Share",
        isSelected: _selectedIndex == 2,
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void updateIndexWatching() {
    setState(() {
      indexHeaderWatching = indexHeaderWatching == 0 ? 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    var dataMovie = Provider.of<Movieproviders>(context);
    late String movieId;
    if (ModalRoute.of(context)!.settings.arguments is String) {
      movieId = ModalRoute.of(context)!.settings.arguments as String;
    } else {
      movieId = "662672c978a71af977967c0f";
    }

    //Provider.of<ReviewProvider>(context).findReviewsByMovieId(movieId);
    MovieModel? movie = dataMovie.findMovieById(movieId);
    //dataMovie.printMovieModelProperties(movie!);
    List<Widget> headerWatching = [
      HeaderImageWatching(
        movie: movie!,
      ),
      ShowVideoScreen(
        movie: movie,
      )
    ];

    return Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    updateIndexWatching();
                  },
                  child: headerWatching[indexHeaderWatching],
                ),
                MainContent(
                  movie: movie,
                  screenWidth: screenWidth,
                  bottomNavBarItems: bottomNavBarItems,
                  onItemTapped: _onItemTapped,
                  callback: updateIndexWatching,
                ),
              ],
            ),
          ),
          const Positioned(
            top: 0,
            left: 5,
            right: 0,
            child: CustomAppBar(),
          )
        ],
      ),
    );
  }
}

class HeaderImageWatching extends StatelessWidget {
  const HeaderImageWatching({
    super.key,
    required this.movie,
  });
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(
        maxHeight: 237,
      ),
      decoration: BoxDecoration(
          color: Colors.transparent, // Thay đổi màu thành trong suốt
          //borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: NetworkImage(movie.thumbnailLandscape),
              fit: BoxFit.fitWidth)),
      child: const Center(
        child: Icon(
          Icons.play_circle_outline_rounded,
          color: AppColors.BaseColorWhite,
          size: 64,
        ),
      ),
    );
  }
}

class ItemWithLineTopWidget extends StatelessWidget {
  final String text;
  final bool hasBar;

  const ItemWithLineTopWidget(
      {Key? key, required this.text, required this.hasBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: hasBar
                  ? AppColors.BaseColorMain
                  : AppColors.BaseColorTransparent,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class MainContent extends StatefulWidget {
  const MainContent({
    Key? key,
    required this.screenWidth,
    required this.bottomNavBarItems,
    required this.onItemTapped,
    required this.callback,
    required this.movie,
  }) : super(key: key);

  final double screenWidth;
  final List<CustomItemBottomBar> bottomNavBarItems;
  final Function(int) onItemTapped;
  final VoidCallback callback;
  final MovieModel movie;
  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dataActor = Provider.of<ActorProviders>(context);
    final listAllActor = dataActor.actors;

    final director =
        listAllActor.firstWhereOrNull((x) => x.id == widget.movie.director);

    final listIdActor =
        ConverterGloabal.removeSpacesAndSplit(widget.movie.actor);
    List<String> names = [];
    for (String id in listIdActor) {
      Actor? actor =
          listAllActor.firstWhereOrNull((element) => element.id == id);
      if (actor!.id != null) {
        names.add(actor.name);
      }
    }
    final StringActor = names.join(", ");
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.movie.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 25,
                          color: AppColors.BaseColorWhite,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${widget.movie.startTime.year} * ${widget.movie.duration} * ${widget.movie.censorship}",
                      style: const TextStyle(
                          color: AppColors.BaseColorAroundWhite,
                          fontSize: 15,
                          decoration: TextDecoration.none),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomTextButton(
                  text: "Play",
                  icon: Icons.play_circle,
                  onPressed: widget.callback,
                ),

                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReadMoreText(
                      widget.movie.description,
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
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Movie genre:',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.BaseColorAroundWhite,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        widget.movie.category,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.BaseColorAroundWhite,
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
                        'Director:',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.BaseColorAroundWhite,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        director == null ? '' : director.name,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.BaseColorAroundWhite,
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
                        'Actor:',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.BaseColorAroundWhite,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        StringActor,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.BaseColorAroundWhite,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomBottomNavigationBar(
                  bottomNavBarItems: widget.bottomNavBarItems,
                  onItemTapped: widget.onItemTapped,
                  selectedIndex: 0, // Chỉ số này có thể được thay
                ),
                const SizedBox(height: 20),
                _buildBody(
                    context, "assets/images/img_1.jpg", widget.movie.id!),
                const SizedBox(height: 20),
                // content tab view preview movie
                _buildTabBar(),
                // listWidgetType[index]
                _buildTabContent(_selectedIndex),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _buildTabItem("Episode", 0),
        _buildTabItem("More", 1),
        _buildTabItem("Trailer", 2),
      ],
    );
  }

  Widget _buildTabItem(String title, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        padding: const EdgeInsets.only(right: 40),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: _selectedIndex == index
                      ? AppColors.BaseColorMain
                      : AppColors.BaseColorTransparent,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                child: Text(
                  title,
                  style: TextStyle(
                    color:
                        _selectedIndex == index ? Colors.yellow : Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ]),
      ),
    );
  }

  Widget _buildTabContent(int index) {
    return Offstage(
      offstage: _selectedIndex != index,
      child: Center(
        child: index == 0
            ? const EpisodeWidget()
            : index == 1
                ? const MovieWidget()
                : const TrailerWidget(),
      ),
    );
  }

  Widget _buildBody(BuildContext context, String imagePath, String movieId) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return BottomSheetReviewMovie(
              movieId: widget.movie.id!,
            );
          },
        );
      },
      child: SizedBox(
        child: CommentWidget(
          movieId: widget.movie.id!,
        ),
      ),
    );
  }
}

class BottomSheetReviewMovie extends StatefulWidget {
  const BottomSheetReviewMovie({
    super.key,
    required this.movieId,
  });
  final String movieId;

  @override
  State<BottomSheetReviewMovie> createState() => _BottomSheetReviewMovieState();
}

class _BottomSheetReviewMovieState extends State<BottomSheetReviewMovie> {
  late List<ReviewModel> reviews = [];

  double _bottomInset = 0;
  late StreamSubscription<bool> _keyboardVisibilitySubscription;

  @override
  void initState() {
    super.initState();

    _keyboardVisibilitySubscription =
        KeyboardVisibilityController().onChange.listen((bool visible) {
      updateInset(visible);
    });
  }

  void updateInset(bool visible) {
    setState(() {
      _bottomInset = visible ? 330 : 0;
    });
  }

  @override
  void dispose() {
    _keyboardVisibilitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reviewData = Provider.of<ReviewProvider>(context);
    reviews = reviewData.reviewsOfMovie;
    final dataAuth = Provider.of<AuthProvider>(context);
    final user = dataAuth.CurrentUser;
    TextEditingController edt = TextEditingController();
    return Container(
      color: Colors.black,
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 6,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: AppColors.BaseColorMain,
            ),
          ),
          const SizedBox(height: 20),
          reviews.isEmpty
              ? const Expanded(
                  child: Center(
                    child: Text(
                      "EMPTY",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                      itemCount: reviews.length,
                      itemBuilder: (context, index) {
                        return ItemDetailReview(
                          review: reviews[index],
                        );
                      }),
                ),
          user == null
              ? const SizedBox()
              : Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  decoration: BoxDecoration(
                      color: AppColors.BackgroundTextFieldReview,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: edt,
                          style:
                              const TextStyle(color: AppColors.BaseColorWhite),
                          decoration: const InputDecoration(
                            hintText: 'write something!',
                            hintStyle: TextStyle(
                              color: AppColors.BaseColorWhite,
                              fontSize: 16,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () async {
                            String userId = await UserPreferences.getUserId();
                            ReviewModel review = ReviewModel(
                                movieId: widget.movieId,
                                userId: userId,
                                comment: edt.text);
                            await reviewData.addReviewMovie(review);
                            await reviewData
                                .findReviewsByMovieId(widget.movieId);
                            edt.text = '';
                            setState(() {});
                          },
                          child: const Text(
                            'Review',
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColors.BaseColorMain,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ),
          SizedBox(height: _bottomInset),
        ],
      ),
    );
  }
}

class ItemDetailReview extends StatelessWidget {
  const ItemDetailReview({
    super.key,
    required this.review,
  });

  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    final dataAuth = Provider.of<AuthProvider>(context);
    final user = dataAuth.users.firstWhereOrNull((e) => e.id == review.userId);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: user!.urlImage == null
                ? Image.asset(
                    'assets/images/avatar.jpg',
                    width: 78.0,
                    height: 78.0,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    user.urlImage.toString(),
                    width: 78.0,
                    height: 78.0,
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      user!.name,
                      style: const TextStyle(
                        color: AppColors.BaseColorMain,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      '12 seconds',
                      style: TextStyle(
                        color: AppColors.BaseColorWhite,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4.0),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    review.comment,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.BaseColorWhite,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                const Row(
                  children: [
                    Text(
                      'Love',
                      style: TextStyle(
                        color: AppColors.BaseColorGrey,
                        fontSize: 12.0,
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Text(
                      'Comment',
                      style: TextStyle(
                        color: AppColors.BaseColorGrey,
                        fontSize: 12.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ClipOval(
                            child: Icon(
                              Icons.favorite_border,
                              color: AppColors.BaseColorWhite,
                              size: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
