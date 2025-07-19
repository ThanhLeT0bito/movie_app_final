import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:movie_app_final/models/data_local/UserPreferences%20.dart';
import 'package:movie_app_final/models/review_model.dart';
import 'package:movie_app_final/providers/AuthProvider.dart';
import 'package:movie_app_final/providers/review_provider.dart';
import 'package:movie_app_final/resources/app_color.dart';
import 'package:movie_app_final/widgets/item_detail_review.dart';
import 'package:provider/provider.dart';

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

    _keyboardVisibilitySubscription = KeyboardVisibilityController().onChange.listen((bool visible) {
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
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.7,
      width: double.infinity,
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
          SizedBox(height: 10),
          Text(
            'Review',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, color: AppColors.BaseColorWhite, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          reviews.isEmpty
              ? Expanded(
                  child: Center(
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image(
                            image: AssetImage('assets/images/empty-folder.png'),
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
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
                    },
                  ),
                ),
          user == null
              ? const SizedBox()
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                  decoration: BoxDecoration(color: AppColors.BackgroundTextFieldReview, borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: edt,
                          style: const TextStyle(color: AppColors.BaseColorWhite),
                          decoration: const InputDecoration(
                            hintText: 'Write Comment!',
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
                            ReviewModel review = ReviewModel(movieId: widget.movieId, userId: userId, comment: edt.text);
                            await reviewData.addReviewMovie(review);
                            await reviewData.findReviewsByMovieId(widget.movieId);
                            edt.text = '';
                            setState(() {});
                          },
                          child: const Text(
                            'Review',
                            style: TextStyle(fontSize: 16, color: AppColors.BaseColorMain, fontWeight: FontWeight.bold),
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
