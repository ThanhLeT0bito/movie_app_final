// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_final/models/data_local/UserPreferences%20.dart';
import 'package:movie_app_final/models/order_model.dart';
import 'package:movie_app_final/providers/AuthProvider.dart';
import 'package:movie_app_final/providers/seats_provider.dart';
import 'package:movie_app_final/services/api_services.dart';
import 'package:http/http.dart' as http;

class OrdersProvider extends ChangeNotifier {
  static const String urlApi = ApiService.urlApi;

  List<OrderModel> _allOrder = [];
  List<OrderModel> get allOrder => _allOrder;

  List<OrderModel> currentListOrderUser = [];

  OrderModel? currentOrderModel;

  String currentUserId =
      //"66117c988b3a5f94e2eed80a"; // khi login thì change value userId
      "";
  String currentMovieId = ""; // done
  String currentTimeMovie = ""; // done
  String currentDateMovie = ""; // done
  int currentSelectedCinema = -1; // done
  int currentSection = 5; //hardcode
  String currentSeats = ""; // done
  double currentTotalPrice = 0; // hardcode
  int currentSelectedPaymentType = -1; // done

  Future<bool> createNewOrder() async {
    var userId = await UserPreferences.getUserId();
    if (userId == '') return false;

    currentUserId = userId;

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

    currentOrderModel = newOM;

    await insertOrder(newOM);

    return true;
  }

  Future<void> getSection() async {
    var seats = await SeatsProviders.findSeatsByMovieId(currentMovieId);

    if (seats.isEmpty) return;

    currentSection = int.parse(seats[0].service);
  }

  Future<void> fetchAllOrder() async {
    try {
      final response = await http.get(Uri.parse('$urlApi/getAllOrder'));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        _allOrder =
            responseData.map((json) => OrderModel.fromJson(json)).toList();
        print("ALL ORDER :${_allOrder.length}");
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

  Future<void> fetchListOrderOfUser() async {
    var userId = await UserPreferences.getUserId();
    currentUserId = userId;

    var listOrder = await fetchListOrdersByUserId(currentUserId);
    currentListOrderUser = listOrder;
    notifyListeners();
  }

  // get list order by user id
  Future<List<OrderModel>> fetchListOrdersByUserId(String userId) async {
    try {
      final response =
          await http.get(Uri.parse('$urlApi/getOrdersByUserId/$userId'));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        List<OrderModel> orders =
            responseData.map((data) => OrderModel.fromJson(data)).toList();
        return orders;
      } else {
        print('Failed to load orders: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error loading orders: $e');
      return [];
    }
  }

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
}
