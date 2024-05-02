import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:movie_app_final/models/model_widget/date.dart';
import 'package:movie_app_final/models/model_widget/seat.dart';
import 'package:movie_app_final/models/model_widget/time.dart';
import 'package:movie_app_final/models/seat_model.dart';
import 'package:movie_app_final/services/api_services.dart';
import 'package:http/http.dart' as http;

class SeatsProviders extends ChangeNotifier {
  static double PRICE_TICKET = 50000;
  static const String urlApi = ApiService.urlApi;

  List<Seat> _listSeat = [];
  List<DateSeat> _listDate = [];
  List<TimeSeat> _listTime = [];

  DateSeat? currentDateSeat;
  TimeSeat? currentTimeSeat;
  double curentTotalPrice = 0;

  ///
  String? currentMovieId;

  String currentSeatId = '';

  String currentListSeat = '';

  //Public
  List<Seat> get listSeat => _listSeat;
  List<DateSeat> get listDate => _listDate;
  List<TimeSeat> get listTime => _listTime;
  SeatsProviders() {
    _generateSeats();
    _generateDate();
    generateTime();
  }

  void updatemMovieId(String movieId) {
    currentMovieId = movieId;
    print('IDDDDDDDDDDDDDDDDDDD:$movieId');
    notifyListeners();
  }

  void _generateSeats() {
    for (var i = 'A'.codeUnitAt(0); i <= 'F'.codeUnitAt(0); i++) {
      for (var j = 1; j <= 8; j++) {
        final seatName = String.fromCharCode(i) + j.toString();
        _listSeat.add(Seat(name: seatName));
      }
    }
  }

  Future<void> InitSeatResrved() async {
    print('MOVIEEE ID: $currentMovieId');

    var seats = await findSeatsByMovieId(currentMovieId!);

    if (seats.isEmpty) return;

    currentSeatId = seats[0].id ?? '';

    List<String> seatList =
        //["A1", "B1"];
        seats[0].reserved.split(RegExp(r',\s*'));

    for (var i in seatList) {
      var seat = _listSeat.firstWhere((element) => element.name == i);
      if (seat == null) continue;
      seat.status = Status.resered;
    }
  }

  Future<void> updateSeat() async {
    if (currentSeatId == '' || currentMovieId == '' || currentListSeat == '') {
      return;
    }

    await updateSeatReserved(currentSeatId, currentListSeat);
    currentListSeat = '';
  }

  String getListSeatSelected() {
    var listSelected = _listSeat.where((e) => e.status == Status.selected);

    var result = '';
    for (var seat in listSelected) {
      result += "${seat.name}, ";
    }

    return result;
  }

  void changeStatusSeat(Seat seat) {
    if (seat.status == Status.resered) return;

    var findSeat = _listSeat.indexWhere((element) => element == seat);

    if (findSeat == -1) return;

    if (_listSeat[findSeat].status == Status.available) {
      _listSeat[findSeat].status = Status.selected;
      curentTotalPrice += PRICE_TICKET;
    } else if (_listSeat[findSeat].status == Status.selected) {
      _listSeat[findSeat].status = Status.available;
      curentTotalPrice -= PRICE_TICKET;
    }

    notifyListeners();
  }

  void _generateDate() {
    DateTime today = DateTime.now();

    for (int i = 0; i < 7; i++) {
      DateTime date = today.add(Duration(days: i));
      String day = date.day.toString();
      String month = _getMonthString(date.month);
      _listDate.add(DateSeat(day: day, month: month));
    }
  }

  void SelectDate(DateSeat date) {
    var findDate = _listDate.indexWhere((element) => element == date);

    if (findDate == -1) return;

    currentDateSeat = date;

    for (var element in _listDate) {
      element.isSelected = false;
      if (element == date) element.isSelected = true;
    }
    notifyListeners();
  }

  void SelectTime(TimeSeat time) {
    var findTime = _listTime.indexWhere((element) => element == time);

    if (findTime == -1) return;

    currentTimeSeat = time;

    for (var element in _listTime) {
      element.isSelected = false;
      if (element == time) element.isSelected = true;
    }
    notifyListeners();
  }

  void generateTime() {
    _listTime.add(TimeSeat(time: "12:05"));
    _listTime.add(TimeSeat(time: "14:40"));
    _listTime.add(TimeSeat(time: "16:20"));
    _listTime.add(TimeSeat(time: "18:00"));
    _listTime.add(TimeSeat(time: "19:05"));
    _listTime.add(TimeSeat(time: "20:10"));
    _listTime.add(TimeSeat(time: "22:00"));
  }

  String _getMonthString(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }

  int getMonthValue(String month) {
    switch (month) {
      case 'Jan':
        return 1;
      case 'Feb':
        return 2;
      case 'Mar':
        return 3;
      case 'Apr':
        return 4;
      case 'May':
        return 5;
      case 'Jun':
        return 6;
      case 'Jul':
        return 7;
      case 'Aug':
        return 8;
      case 'Sep':
        return 9;
      case 'Oct':
        return 10;
      case 'Nov':
        return 11;
      case 'Dec':
        return 12;
      default:
        return 0;
    }
  }

///// calll api

// Phương thức để tìm các ghế theo movieId
  static Future<List<SeatModel>> findSeatsByMovieId(String movieId) async {
    try {
      final response = await http.get(
        Uri.parse('$urlApi/findSeatsByMovieId/$movieId'),
      );

      if (response.statusCode == 200) {
        // Nếu thành công, chuyển đổi dữ liệu JSON thành danh sách các ghế
        List<dynamic> data = json.decode(response.body);
        List<SeatModel> seats =
            data.map((json) => SeatModel.fromJson(json)).toList();
        return seats;
      } else {
        // Nếu không thành công, thông báo lỗi cho người dùng
        throw Exception('Failed to find seats by movieId');
      }
    } catch (error) {
      // Nếu xảy ra lỗi trong quá trình gửi yêu cầu, thông báo lỗi cho người dùng
      throw Exception('Error finding seats by movieId: $error');
    }
  }

// Phương thức để cập nhật trường reserved của một ghế bằng cách thêm giá trị reserved mới
  static Future<bool> updateSeatReserved(String id, String reserved) async {
    try {
      final response = await http.put(
        Uri.parse('$urlApi/updateSeatReserved/$id'),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"reserved": reserved}),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }
}
