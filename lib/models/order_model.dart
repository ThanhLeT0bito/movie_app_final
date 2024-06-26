import 'package:flutter/material.dart';

class OrderModel with ChangeNotifier {
  final String? id;
  final String userId;
  final String movieId;
  final String dateMovie;
  final String timeMovie;
  final int section;
  final String seats;
  final double prices;
  final String nameCinema;
  final String locationCinema;
  final DateTime? created;
  final String paymentType;

  OrderModel(
      {this.id,
      required this.userId,
      required this.movieId,
      required this.dateMovie,
      required this.timeMovie,
      required this.section,
      required this.seats,
      required this.prices,
      required this.nameCinema,
      required this.locationCinema,
      this.created,
      required this.paymentType});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['_id'],
      userId: json['userId'],
      movieId: json['movieId'],
      dateMovie: json['dateMovie'],
      timeMovie: json['timeMovie'],
      section: json['section'],
      seats: json['seats'],
      prices: json['prices'].toDouble(),
      nameCinema: json['nameCinema'],
      locationCinema: json['locationCinema'],
      created: json['created'] != null ? DateTime.parse(json['created']) : null,
      paymentType: json['paymentType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'movieId': movieId,
      'userId': userId,
      'dateMovie': dateMovie,
      'timeMovie': timeMovie,
      'section': section,
      'seats': seats,
      'prices': prices,
      'nameCinema': nameCinema,
      'locationCinema': locationCinema,
      'created': created,
      'paymentType': paymentType
    };
  }
}
