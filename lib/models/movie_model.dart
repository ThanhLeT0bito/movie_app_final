class MovieModel {
  final String id;
  final String name;
  final String slug;
  final String trailerUrl;
  final String description;
  final String content;
  final String thumbnail;
  final String category;
  final String director;
  final String actor;
  final String language;
  final String publish;
  final String censorship;
  final String duration;
  final DateTime startTime;
  final DateTime endTime;
  final double reviewPoint;
  final String createdBy;
  final DateTime createdAt;
  final bool isWatching;
  final String videoUrl;
  final String thumbnailLandscape;

  MovieModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.trailerUrl,
    required this.description,
    required this.content,
    required this.thumbnail,
    required this.category,
    required this.director,
    required this.actor,
    required this.language,
    required this.publish,
    required this.censorship,
    required this.duration,
    required this.startTime,
    required this.endTime,
    required this.reviewPoint,
    required this.createdBy,
    required this.createdAt,
    required this.isWatching,
    required this.videoUrl,
    required this.thumbnailLandscape,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      trailerUrl: json['trailerUrl'] ?? '',
      description: json['description'] ?? '',
      content: json['content'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      category: json['category'] ?? '',
      director: json['director'] ?? '',
      actor: json['actor'] ?? '',
      language: json['language'] ?? '',
      publish: json['publish'] ?? '',
      censorship: json['censorship'] ?? '',
      duration: json['duration'] ?? '',
      startTime: DateTime.parse(json['startTime']) ?? DateTime.now(),
      endTime: DateTime.parse(json['endTime']) ?? DateTime.now(),
      reviewPoint: json['reviewPoint'].toDouble() ?? 0.0,
      createdBy: json['createdBy'] ?? '',
      createdAt: DateTime.parse(json['createdAt']) ?? DateTime.now(),
      isWatching: json['isWatching'] ?? false,
      videoUrl: json['videoUrl'] ?? '',
      thumbnailLandscape: json['thumbnailLandscape'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'slug': slug,
      'trailerUrl': trailerUrl,
      'description': description,
      'content': content,
      'thumbnail': thumbnail,
      'category': category,
      'director': director,
      'actor': actor,
      'language': language,
      'publish': publish,
      'censorship': censorship,
      'duration': duration,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'reviewPoint': reviewPoint,
      'createdBy': createdBy,
      'createdAt': createdAt.toIso8601String(),
      'isWatching': isWatching,
      'videoUrl': videoUrl,
      'thumbnailLandscape': thumbnailLandscape,
    };
  }
}
