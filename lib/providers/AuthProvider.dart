import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;
import '../services/api_services.dart';

class AuthProvider extends ChangeNotifier {
  static const String urlApi = ApiService.urlApi;
  List<User> list = [];
  List<User> _users = [];
  List<User> get users => _users;

  Future<void> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse('$urlApi/getUsers'));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        _users = responseData.map((json) => User.fromJson(json)).toList();
        for (var element in _users) {
          print(element.name);
        }
        notifyListeners();
      } else {
        print('Failed to load users: ${response.statusCode}');
      }
    } catch (e) {
      print('Error loading users: $e');
    }
  }

  Future<void> insertUser(User user) async {
    try {
      final response = await http.post(
        Uri.parse('$urlApi/insertUser'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 201) {
        // User inserted successfully
        fetchUsers();
        notifyListeners();
        print('User inserted successfully');
      } else {
        print('Failed to insert user: ${response.body}');
      }
    } catch (error) {
      print('Error inserting user: $error');
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      final response = await http.delete(
        Uri.parse('$urlApi/deleteUser/$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        fetchUsers();
        notifyListeners();
        print('User deleted successfully');
      } else {
        print('Failed to delete user: ${response.body}');
      }
    } catch (error) {
      print('Error deleting user: $error');
    }
  }

  Future<void> updateUser(
      String userId, String newName, String urlImage) async {
    try {
      final response = await http.put(
        Uri.parse('$urlApi/updateUser/$userId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'name': newName, 'urlImage': urlImage}),
      );

      if (response.statusCode == 200) {
        // Người dùng đã được cập nhật thành công
        print('User updated successfully');
      } else {
        // Xảy ra lỗi khi cập nhật người dùng
        print('Failed to update user: ${response.body}');
      }
    } catch (error) {
      // Xảy ra ngoại lệ trong quá trình gửi yêu cầu HTTP
      print('Error updating user: $error');
    }
  }

  User CurrentUser = User(
      id: "123",
      name: "Nghĩa",
      phone: "+8412345678",
      mail: "NghiaDan@gmail.com");
}
