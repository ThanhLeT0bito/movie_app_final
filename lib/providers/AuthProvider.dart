import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;
import '../services/api_services.dart';

class AuthProvider extends ChangeNotifier {
  static const String urlApi = ApiService.urlApi;
  List<Users> list = [];
  List<Users> _users = [];
  List<Users> get users => _users;
  late User? _firebaseUser;
  late String localVerificationId;

  User? get firebaseUser => _firebaseUser;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserProvider() {
    _auth.authStateChanges().listen((User? user) {
      _firebaseUser = user;
      notifyListeners();
    });
  }

  final databaseReference = FirebaseDatabase.instance.reference();

  void TestFirebase() {
    databaseReference.child('alooo').set("Nghia Dan");
  }

  Future<void> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse('$urlApi/getUsers'));
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        _users = responseData.map((json) => Users.fromJson(json)).toList();
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

  Future<void> insertUser(Users user) async {
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

  Users CurrentUser = Users(
      id: "123",
      name: "Nghĩa",
      phone: "+8412345678",
      mail: "NghiaDan@gmail.com");

//// send otp

  Future<void> requestOTP(String phoneNumber) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+84" + phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
          print('Đăng nhập thành công');
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('Số điện thoại không hợp lệ');
          } else {
            print('Lỗi không xác định: ${e.message}');
          }
        },
        codeSent: (String verificationId, [int? resendToken]) {
          localVerificationId = verificationId;
          print(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Mã xác minh đã hết hạn
          print('Mã xác minh đã hết hạn');
        },
        timeout: Duration(
            seconds: 120), // Thời gian chờ để nhận mã OTP (tính bằng giây)
      );
    } catch (e) {
      print('Yêu cầu gửi mã OTP thất bại: $e');
      // Xử lý lỗi khi yêu cầu gửi mã OTP thất bại
    }
  }

////  check auth
  ///
  Future<bool> signIn(String code) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: localVerificationId, smsCode: code);
    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (userCredential.user != null) {
        return true;
      } else {
        return false;
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.code);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    return false;
  }
}
