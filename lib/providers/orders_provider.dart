import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app_final/models/order_model.dart';
import 'package:movie_app_final/services/api_services.dart';
import 'package:http/http.dart' as http;

class OrdersProvider extends ChangeNotifier {
  static const String urlApi = ApiService.urlApi;

  List<OrderModel> _allOrder = [];
  List<OrderModel> get allOrder => _allOrder;

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
