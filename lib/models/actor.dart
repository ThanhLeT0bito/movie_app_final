class Actor {
  String name;
  String images;

  Actor({
    required this.name,
    required this.images,
  });

  factory Actor.fromJson(Map<String, dynamic> json) {
    return Actor(
      name: json['name'],
      images: json['images'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'images': images,
    };
  }
}
