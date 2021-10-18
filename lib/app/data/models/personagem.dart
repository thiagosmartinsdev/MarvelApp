class Personagem {
  int id;
  String name;
  String pathPhoto;
  String description;

  Personagem({
    required this.id,
    required this.name,
    required this.pathPhoto,
    required this.description,
  });

  factory Personagem.fromJson(Map json) {
    return Personagem(
      id: json['id'],
      name: json['name'],
      pathPhoto:
          json['thumbnail']['path'] + '.' + json['thumbnail']['extension'],
      description: json['description'],
    );
  }

  static List<Personagem> fromJsonList(List json) {
    return json.map((e) => Personagem.fromJson(e)).toList();
  }
}
