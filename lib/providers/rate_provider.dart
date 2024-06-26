import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app_final/models/rate.dart';
import 'package:movie_app_final/services/api_services.dart';

class RateProvider extends ChangeNotifier {
  static const String urlApi = ApiService.urlApi;

  List<Rate> _rates = [];
  List<Rate> get rates => _rates;

  List<Rate> listRateOfMovie = [];

  Future<void> fetchRates() async {
    try {
      final response = await http.get(Uri.parse('$urlApi/getAllRateMovies'));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        _rates = responseData.map((json) => Rate.fromJson(json)).toList();
        notifyListeners();
      } else {
        print('Failed to load rates: ${response.statusCode}');
      }
    } catch (e) {
      print('Error loading rates: $e');
    }
  }

  Future<void> fetchListratesOfMovie(String movieId) async {
    listRateOfMovie = await getListRateFromMovieId(movieId);
  }

  Future<List<Rate>> getListRateFromMovieId(String movieId) async {
    try {
      final response =
          await http.get(Uri.parse('$urlApi/findRateMoviesByMovieId/$movieId'));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        List<Rate> rates =
            responseData.map((json) => Rate.fromJson(json)).toList();
        return rates;
      } else {
        print('Failed to load rates: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error loading rates: $e');
      return [];
    }
  }

  Future<void> postRate(String userId, String movieId, String comment) async {
    try {
      final response = await http.post(
        Uri.parse('$urlApi/insertRateMovie'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'userId': userId,
          'movieId': movieId,
          'comment': comment,
        }),
      );

      if (response.statusCode == 201) {
        fetchRates();
        notifyListeners();
        print('Rate posted successfully');
      } else {
        print('Failed to post rate: ${response.body}');
      }
    } catch (error) {
      print('Error posting rate: $error');
    }
  }

  Future<void> deleteRate(String rateId) async {
    try {
      final response = await http.delete(
        Uri.parse('$urlApi/deleteRateMovie/$rateId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        fetchRates();
        notifyListeners();
        print('Rate deleted successfully');
      } else {
        print('Failed to delete rate: ${response.body}');
      }
    } catch (error) {
      print('Error deleting rate: $error');
    }
  }
}
