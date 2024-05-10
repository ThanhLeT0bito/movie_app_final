import 'package:flutter/cupertino.dart';

class ReviewModel with ChangeNotifier {
  String? id;
  String movieId;
  String userId;
  String? reviewParentId;
  String comment;
  int? love;
  DateTime? createdAt;

  ReviewModel({
    this.id,
    required this.movieId,
    required this.userId,
    this.reviewParentId,
    required this.comment,
    this.love,
    this.createdAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        id: json['_id'],
        movieId: json['movieId'],
        userId: json['userId'],
        reviewParentId: json['reviewParentId'],
        comment: json['comment'],
        love: json['love'],
        createdAt: json['createdAt'] != null
            ? DateTime.parse(json['createdAt'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'movieId': movieId,
        'userId': userId,
        'reviewParentId': reviewParentId,
        'comment': comment,
        'love': love,
        'createdAt': createdAt?.toIso8601String(),
      };
}
