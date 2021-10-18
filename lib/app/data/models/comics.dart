class Comic {
  int id;
  String title;
  String description;
  String thumbnail;
  // List<String> images;

  Comic({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    // required this.images,
  });

  factory Comic.fromJson(Map json) {
    return Comic(
      id: json['id'],
      title: json['title'],
      description: json['description'] ??= 'No description',
      thumbnail:
          json['thumbnail']['path'] + '.' + json['thumbnail']['extension'],
    );
  }

  static List<Comic> fromJsonList(List json) {
    return json.map((e) => Comic.fromJson(e)).toList();
  }
}
