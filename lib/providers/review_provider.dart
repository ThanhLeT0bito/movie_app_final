import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:movie_app_final/models/review_model.dart';
import 'package:movie_app_final/services/api_services.dart';
import 'package:http/http.dart' as http;

class ReviewProvider extends ChangeNotifier {
  static const String urlApi = ApiService.urlApi;

  List<ReviewModel> reviewsOfMovie = [];

  ReviewModel? firstReview;

  Future<void> addReviewMovie(ReviewModel review) async {
    await insertReview(review);
  }

  //call api
  Future<void> findReviewsByMovieId(String movieId) async {
    final url = '$urlApi/findReviewsByMovieId/$movieId';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        List<ReviewModel> reviews =
            responseData.map((review) => ReviewModel.fromJson(review)).toList();

        reviewsOfMovie = reviews.reversed.toList();
        firstReview = reviewsOfMovie.firstOrNull;
        //return reviews;
      } else {
        print('Failed to find reviews by movieId: ${response.statusCode}');
        //return [];
      }
    } catch (e) {
      print('Error finding reviews by movieId: $e');
      //return [];
    }
  }

  Future<void> insertReview(ReviewModel review) async {
    const url = '$urlApi/insertReview';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(review.toJson()),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 201) {
        print('Review created successfully');
      } else {
        print('Failed to create review: ${response.statusCode}');
      }
    } catch (e) {
      print('Error inserting review: $e');
    }
  }
}
