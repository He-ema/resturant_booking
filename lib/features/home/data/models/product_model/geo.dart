class Geo {
  final String longitude;
  final String latitude;

  Geo({
    required this.longitude,
    required this.latitude,
  });

  factory Geo.fromJson(jsonData) {
    return Geo(
      longitude: jsonData['longitude'],
      latitude: jsonData['latitude'],
    );
  }
}
