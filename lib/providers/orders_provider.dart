import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app_final/models/order_model.dart';
import 'package:movie_app_final/providers/AuthProvider.dart';
import 'package:movie_app_final/services/api_services.dart';
import 'package:http/http.dart' as http;

class OrdersProvider extends ChangeNotifier {
  static const String urlApi = ApiService.urlApi;

  List<OrderModel> _allOrder = [];
  List<OrderModel> get allOrder => _allOrder;

  String currentUserId = "66117c988b3a5f94e2eed80a"; // chuaw set
  String currentMovieId = ""; // done
  String currentTimeMovie = ""; // done
  String currentDateMovie = ""; // done
  int currentSelectedCinema = -1; // done
  int currentSection = 5; //hardcode
  String currentSeats = ""; // done
  double currentTotalPrice = 200000; // hardcode
  int currentSelectedPaymentType = -1; // done

  List<String> listNameCinema = [
    "Vincom Ocean Park CGV",
    " Mall CGV",
    "Lotte Cinema Long Bien"
  ];
  List<String> listLocationCinema = [
    "4.55 km | Da Ton, Gia Lam, Ha Noi",
    "9.32 km | 27 Co Linh, Long Bien, Ha Noi",
    "14.3 km | 7-9 Nguyen Van Linh, Long Bien, Ha Noi"
  ];

  List<String> listPaymentType = [
    "Zalo Pay",
    "MoMo",
    "Shoppe Pay",
    "ATM Card",
    "International payments"
  ];

  Future<void> createNewOrder() async {
    OrderModel newOM = OrderModel(
        userId: currentUserId,
        movieId: currentMovieId,
        dateMovie: currentDateMovie,
        timeMovie: currentTimeMovie,
        section: currentSection,
        seats: currentSeats,
        prices: currentTotalPrice,
        nameCinema: listNameCinema[currentSelectedCinema],
        locationCinema: listLocationCinema[currentSelectedCinema],
        paymentType: listPaymentType[currentSelectedPaymentType]);

    await insertOrder(newOM);
  }

  Future<void> fetchAllOrder() async {
    try {
      final response = await http.get(Uri.parse('$urlApi/getAllOrder'));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        _allOrder =
            responseData.map((json) => OrderModel.fromJson(json)).toList();
        for (var element in _allOrder) {
          print(element.movieId);
        }
        notifyListeners();
      } else {
        print('Failed to load orders: ${response.statusCode}');
      }
    } catch (e) {
      print('Error loading users: $e');
    }
  }

  Future<void> insertOrder(OrderModel order) async {
    try {
      final response = await http.post(
        Uri.parse('$urlApi/addOrder'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(order.toJson()),
      );

      if (response.statusCode == 201) {
        fetchAllOrder();
        notifyListeners();
        print('Order inserted successfully');
      } else {
        print('Failed to insert Order: ${response.body}');
      }
    } catch (error) {
      print('Error inserting user: $error');
    }
  }

  // get order by id
  Future<OrderModel?> fetchOrderById(String orderId) async {
    try {
      final response =
          await http.get(Uri.parse('$urlApi/getOrderById/$orderId'));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return OrderModel.fromJson(responseData);
      } else {
        print('Failed to load order: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error loading order: $e');
      return null;
    }
  }
}
