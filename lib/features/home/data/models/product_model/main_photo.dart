class MainPhoto {
  final String source;

  MainPhoto({required this.source});

  factory MainPhoto.fromJson(jsonData) {
    return MainPhoto(
      source: jsonData['source'],
    );
  }
}
