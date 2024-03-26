import 'package:flutter/material.dart';
import 'package:movie_app_final/models/model_widget/date.dart';
import 'package:movie_app_final/models/model_widget/seat.dart';
import 'package:movie_app_final/models/model_widget/time.dart';

class SeatsProviders extends ChangeNotifier {
  List<Seat> _listSeat = [];
  List<DateSeat> _listDate = [];
  List<TimeSeat> _listTime = [];

  //Public
  List<Seat> get listSeat => _listSeat;
  List<DateSeat> get listDate => _listDate;
  List<TimeSeat> get listTime => _listTime;
  SeatsProviders() {
    _generateSeats();
    _generateDate();
    generateTime();
  }

  void _generateSeats() {
    for (var i = 'A'.codeUnitAt(0); i <= 'F'.codeUnitAt(0); i++) {
      for (var j = 1; j <= 8; j++) {
        final seatName = String.fromCharCode(i) + j.toString();
        _listSeat.add(Seat(name: seatName));
      }
    }
    _listSeat[1].status = Status.resered;
    _listSeat[3].status = Status.resered;
    _listSeat[5].status = Status.resered;
    _listSeat[6].status = Status.resered;
    _listSeat[4].status = Status.resered;
    _listSeat[11].status = Status.resered;
    _listSeat[12].status = Status.resered;
    _listSeat[10].status = Status.resered;
    _listSeat[16].status = Status.selected;
    _listSeat[18].status = Status.resered;
    _listSeat[20].status = Status.selected;
  }

  void changeStatusSeat(Seat seat) {
    if (seat.status == Status.resered) return;

    var findSeat = _listSeat.indexWhere((element) => element == seat);

    if (findSeat == -1) return;

    if (_listSeat[findSeat].status == Status.available) {
      _listSeat[findSeat].status = Status.selected;
    } else if (_listSeat[findSeat].status == Status.selected) {
      _listSeat[findSeat].status = Status.available;
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

    for (var element in _listDate) {
      element.isSelected = false;
      if (element == date) element.isSelected = true;
    }
    notifyListeners();
  }

  void SelectTime(TimeSeat time) {
    var findTime = _listTime.indexWhere((element) => element == time);

    if (findTime == -1) return;

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
}
