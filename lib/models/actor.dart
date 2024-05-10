class Actor {
  String? id;
  String name;
  String images;

  Actor({
    this.id,
    required this.name,
    required this.images,
  });

  factory Actor.fromJson(Map<String, dynamic> json) {
    return Actor(
      id: json['_id'],
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
