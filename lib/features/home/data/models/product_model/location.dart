import 'package:equatable/equatable.dart';

import 'city.dart';

class Location extends Equatable {
  final City? city;
  final String? type;
  final dynamic radius;

  const Location({this.city, this.type, this.radius});

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        city: json['city'] == null
            ? null
            : City.fromJson(json['city'] as Map<String, dynamic>),
        type: json['type'] as String?,
        radius: json['radius'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'city': city?.toJson(),
        'type': type,
        'radius': radius,
      };

  @override
  List<Object?> get props => [city, type, radius];
}
