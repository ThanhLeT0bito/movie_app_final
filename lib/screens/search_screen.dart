import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:movie_app_final/models/movie_model.dart';
import 'package:movie_app_final/providers/movie_providers.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/resources/dimens.dart';
import 'package:movie_app_final/widgets/now_playing.dart';
import 'package:provider/provider.dart';
import 'package:tiengviet/tiengviet.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static const String routeName = '/search-screen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();

  List<MovieModel> allmovies = [];
  List<MovieModel> _searchResult = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
      allmovies =
          Provider.of<Movieproviders>(context, listen: false).listAllMovie;
    });
  }

  void _searchMovies(String query) {
    if (query.isEmpty ||
        removeExtraSpaces(query) == '' ||
        query.removeAllWhitespace == '') {
      setState(() {
        _searchResult = [];
      });
      return;
    }
    query = TiengViet.parse(removeExtraSpaces(query.toLowerCase()));
    var keySearchs = splitString(query);
    setState(() {
      _searchResult = allmovies
          .where((movie) =>
              keySearchs.any((key) =>
                  TiengViet.parse(removeExtraSpaces(movie.name.toLowerCase()))
                      .contains(key)) ||
              keySearchs.any((key) => TiengViet.parse(
                      removeExtraSpaces(movie.description.toLowerCase()))
                  .contains(key)) ||
              keySearchs.any((key) => TiengViet.parse(
                      removeExtraSpaces(movie.category.toLowerCase()))
                  .contains(key)))
          .toList();
    });
  }

  String removeExtraSpaces(String input) {
    return input.replaceAll(RegExp(r'\s+'), ' ').trim();
  }

  List<String> splitString(String input) {
    return input.split(RegExp(r'\s+'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BaseColorBlackGround,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                        color: AppColors.BaseColorWhite,
                      )),
                  IconButton(
                    icon: const Icon(Icons.mic,
                        color: Colors.white), // Thêm màu trắng cho icon search
                    onPressed: () {
                      // Xử lý khi nhấn vào icon search
                    },
                  ),
                  Expanded(
                    child: TextField(
                      focusNode: _focusNode,
                      controller: _controller,
                      onChanged: _searchMovies,
                      style: const TextStyle(
                          color: Colors
                              .white), // Đặt màu chữ của TextField thành màu trắng
                      decoration: const InputDecoration(
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                            color: Colors
                                .white), // Đặt màu chữ cho hint thành màu trắng
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search,
                        color:
                            Colors.white), // Thêm màu trắng cho icon microphone
                    onPressed: () {
                      // Xử lý khi nhấn vào icon microphone
                    },
                  ),
                ],
              ),
            ),
            _searchResult.isEmpty
                ? Expanded(
                    child: Center(
                      child: Container(
                          width: 250,
                          height: 250,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Image(
                            image: AssetImage('assets/images/empty-folder.png'),
                            height: 200,
                            width: 200,
                          )),
                    ),
                  )
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimens.padding_comingSoon),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 5.0,
                          childAspectRatio: 0.45,
                        ),
                        itemCount: _searchResult.length,
                        itemBuilder: (BuildContext context, int index) {
                          return NowplayingItems(movie: _searchResult[index]);
                        },
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
