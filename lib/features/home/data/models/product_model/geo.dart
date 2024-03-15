import 'package:equatable/equatable.dart';

class Geo extends Equatable {
  final String? longitude;
  final String? latitude;

  const Geo({this.longitude, this.latitude});

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        longitude: json['longitude'] as String?,
        latitude: json['latitude'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'longitude': longitude,
        'latitude': latitude,
      };

  @override
  List<Object?> get props => [longitude, latitude];
}
