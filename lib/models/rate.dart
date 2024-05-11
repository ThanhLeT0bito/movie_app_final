import 'dart:ffi';

class Rate {
  String? id;
  String movieId;
  String userId;
  double rate;
  String comment;
  DateTime createdAt;

  Rate({
    this.id,
    required this.movieId,
    required this.userId,
    required this.rate,
    required this.comment,
    required this.createdAt,
  });

  factory Rate.fromJson(Map<String, dynamic> json) {
    return Rate(
      id: json['_id'],
      movieId: json['movieId'],
      userId: json['userId'],
      rate: json['rate'],
      comment: json['comment'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'movieId': movieId,
      'userId': userId,
      'rate': rate,
      'comment': comment,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
