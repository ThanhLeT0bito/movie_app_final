import 'package:flutter/material.dart';

class SeatModel {
  final String? id;
  final String movieId;
  final String reserved;
  final String service;

  SeatModel({
    this.id,
    required this.movieId,
    required this.reserved,
    required this.service,
  });

  factory SeatModel.fromJson(Map<String, dynamic> json) {
    return SeatModel(
      id: json['_id'],
      movieId: json['movieId'],
      reserved: json['reserved'],
      service: json['service'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'movieId': movieId,
      'reserved': reserved,
      'service': service,
    };
  }
}
