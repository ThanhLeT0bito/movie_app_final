// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_final/models/data_local/UserPreferences%20.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;
import '../services/api_services.dart';

class AuthProvider extends ChangeNotifier {
  static const String urlApi = ApiService.urlApi;

  bool IsSign = true;

  String currentUserId = "66117c988b3a5f94e2eed80a";

  String currentPhone = '';
  String currentName = '';

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

  final databaseReference = FirebaseDatabase.instance.ref();

  void TestFirebase() {
    databaseReference.child('alooo').set("Nghia Dan");
  }

  Future<void> getCurrentUser() async {
    print("helooo");
    String UserId = await UserPreferences.getUserId();
    CurrentUser = _users.firstWhereOrNull((e) => e.id == UserId);
    notifyListeners();
  }

  Future<void> setSharePreferenceUserId(String phone) async {
    var user = await fetchUserByPhone(phone);
    if (user != null) {
      if (user.id != null) {
        String UserId = user.id ?? '';
        print(",,,,,,,,,,,,,,,");
        print(UserId);
        await UserPreferences.setUserId(UserId);
        print("Set Share Preference User OK!");
      }
    }

    notifyListeners();
  }

  Future<bool> checkSignIn(String phone) async {
    var user = await fetchUserByPhone(phone);
    if (user != null) return true;

    return false;
  }

  Future<void> logout() async {
    currentUserId = '';
    CurrentUser = null;
    await UserPreferences.setUserId('');
    notifyListeners();
  }

  Future<bool> addNewUser() async {
    Users user = Users(name: currentName, phone: currentPhone);
    print('ADDDDDD USERRRR');
    print(user.name);
    print(user.phone);
    var addUser = await insertUser(user);
    if (!addUser) return false;
    CurrentUser = user;
    await setSharePreferenceUserId(currentPhone);
    return true;
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

  Future<Users?> fetchUserByPhone(String phone) async {
    try {
      final response =
          await http.get(Uri.parse('$urlApi/getUserByPhone/$phone'));
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return Users.fromJson(responseData);
      } else {
        print('Failed to load user: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error loading user: $e');
      return null;
    }
  }

  Future<bool> insertUser(Users user) async {
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
        //fetchUsers();
        notifyListeners();
        print('User inserted successfully');
        return true;
      } else {
        print('Failed to insert user: ${response.body}');
        return false;
      }
    } catch (error) {
      print('Error inserting user: $error');
      return false;
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
    notifyListeners();
  }

  Users? CurrentUser;

//// send otp

  Future<void> requestOTP(String phoneNumber) async {
    print('CHECK CURRENT PHONE');
    print(phoneNumber);
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+84$phoneNumber",
        verificationCompleted: (PhoneAuthCredential credential) async {
          try {
            await FirebaseAuth.instance.signInWithCredential(credential);
            print('Đăng nhập thành công');
          } catch (e) {
            print('Lỗi khi đăng nhập tự động: $e');
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          print('Lỗi xác thực: \\${e.code} - \\${e.message}');
        },
        codeSent: (String verificationId, [int? resendToken]) {
          localVerificationId = verificationId;
          print('VerificationId: $verificationId');
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print('Mã xác minh đã hết hạn');
        },
        timeout: const Duration(seconds: 120),
      );
    } catch (e, stack) {
      print('Yêu cầu gửi mã OTP thất bại: $e');
      print('Stacktrace: $stack');
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
