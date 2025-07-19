import 'dart:async';
import 'dart:ffi';
import 'dart:io';

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
import 'package:movie_app_final/widgets/bottom_sheet_review_movie.dart';
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

  bool _isPlaying = false;

  late Widget _headerWidget = HeaderImageWatching(
    movie: _movie!,
  );
  ShowVideoScreen? _videoScreen;
  final GlobalKey<ShowVideoScreenState> _videoKey =
      GlobalKey<ShowVideoScreenState>();

  late String movieId;
  bool _isInit = false, _isFirst = true;

  late MovieModel? _movie;

  Duration startAt = Duration.zero;

  void saveDuration(Duration newDuration) {
    startAt = newDuration;
  }

  void playVideo(bool isPlaying) {
    if (isPlaying) {
      _videoKey.currentState?.play();
    } else {
      _videoKey.currentState?.pause();
    }
  }

  @override
  void initState() {
    super.initState();

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

  @override
  void didChangeDependencies() {
    if (ModalRoute.of(context)!.settings.arguments is String) {
      movieId = ModalRoute.of(context)!.settings.arguments as String;
    } else {
      movieId = "662672c978a71af977967c0f";
    }

    var dataMovie = Provider.of<Movieproviders>(context);

    //Provider.of<ReviewProvider>(context).findReviewsByMovieId(movieId);
    _movie = dataMovie.findMovieById(movieId);

    super.didChangeDependencies();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void updatePlayStatus() {
    setState(() {
      if (_isFirst) {
        _videoScreen = ShowVideoScreen(
          key: _videoKey,
          movie: _movie!,
          startAt: Duration.zero,
          onVideoPositionChanged: (Duration newDuration) {
            saveDuration(newDuration);
          },
        );

        _headerWidget = _videoScreen!;
        _videoKey.currentState?.play();
        _isFirst = false;
      }

      _isPlaying = !_isPlaying;
      playVideo(_isPlaying);
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 70),
              GestureDetector(
                child: _headerWidget,
                onTap: updatePlayStatus,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      MainContent(
                        movie: _movie!,
                        screenWidth: screenWidth,
                        bottomNavBarItems: bottomNavBarItems,
                        onItemTapped: _onItemTapped,
                        callback: () {
                          updatePlayStatus();
                        },
                        isPlaying: _isPlaying,
                        onBottomSheetOpened: () {
                          playVideo(false);
                        },
                        onBottomSheetClosed: () {
                          playVideo(true);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Positioned(
            top: 0,
            left: 5,
            right: 0,
            child: CustomAppBar(
              margin: EdgeInsets.only(top: Dimens.MarginTopAppbarIPhone),
            ),
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
    required this.isPlaying,
    this.onBottomSheetOpened,
    this.onBottomSheetClosed,
  }) : super(key: key);

  final double screenWidth;
  final List<CustomItemBottomBar> bottomNavBarItems;
  final Function(int) onItemTapped;
  final VoidCallback callback;
  final MovieModel movie;
  final bool isPlaying;
  final VoidCallback? onBottomSheetOpened;
  final VoidCallback? onBottomSheetClosed;
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
      if (actor != null) {
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
                  text: widget.isPlaying ? "Pause" : "Play",
                  icon:
                      widget.isPlaying ? Icons.pause_circle : Icons.play_circle,
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
                      trimCollapsedText: 'See more',
                      trimExpandedText: 'Hide',
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
      onTap: () async {
        if (widget.onBottomSheetOpened != null) {
          widget.onBottomSheetOpened!();
        }
        await showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return BottomSheetReviewMovie(
              movieId: widget.movie.id!,
            );
          },
        );
        if (widget.onBottomSheetClosed != null) {
          widget.onBottomSheetClosed!();
        }
      },
      child: SizedBox(
        width: widget.screenWidth,
        child: CommentWidget(
          movieId: widget.movie.id!,
        ),
      ),
    );
  }
}
