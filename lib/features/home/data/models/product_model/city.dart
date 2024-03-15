import 'package:equatable/equatable.dart';

import 'slugs_by_locale.dart';

class City extends Equatable {
  final SlugsByLocale? slugsByLocale;
  final int? id;
  final String? name;
  final int? countryId;
  final String? slug;
  final bool? hasHomepage;
  final double? latitude;
  final double? longitude;
  final bool? isSeoIndexed;
  final String? photo;

  const City({
    this.slugsByLocale,
    this.id,
    this.name,
    this.countryId,
    this.slug,
    this.hasHomepage,
    this.latitude,
    this.longitude,
    this.isSeoIndexed,
    this.photo,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        slugsByLocale: json['slugsByLocale'] == null
            ? null
            : SlugsByLocale.fromJson(
                json['slugsByLocale'] as Map<String, dynamic>),
        id: json['id'] as int?,
        name: json['name'] as String?,
        countryId: json['countryId'] as int?,
        slug: json['slug'] as String?,
        hasHomepage: json['hasHomepage'] as bool?,
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
        isSeoIndexed: json['isSeoIndexed'] as bool?,
        photo: json['photo'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'slugsByLocale': slugsByLocale?.toJson(),
        'id': id,
        'name': name,
        'countryId': countryId,
        'slug': slug,
        'hasHomepage': hasHomepage,
        'latitude': latitude,
        'longitude': longitude,
        'isSeoIndexed': isSeoIndexed,
        'photo': photo,
      };

  @override
  List<Object?> get props {
    return [
      slugsByLocale,
      id,
      name,
      countryId,
      slug,
      hasHomepage,
      latitude,
      longitude,
      isSeoIndexed,
      photo,
    ];
  }
}
