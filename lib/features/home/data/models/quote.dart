class Quote {
  final int id;
  final String text;
  final String author;
  final String image;

  Quote({
    required this.id,
    required this.text,
    required this.author,
    required this.image,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['id'] ?? 0,
      text: json['text'] ?? '',
      author: json['author'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'author': author,
      'image': image,
    };
  }
}
