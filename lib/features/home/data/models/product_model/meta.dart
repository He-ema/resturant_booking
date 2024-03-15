import 'package:equatable/equatable.dart';

import 'city.dart';
import 'filter.dart';
import 'location.dart';
import 'page.dart';
import 'price.dart';
import 'sort.dart';
import 'tag_category.dart';
import 'the_fork_advantages.dart';

class Meta extends Equatable {
  final City? city;
  final List<Filter>? filters;
  final Location? location;
  final List<Sort>? sort;
  final TheForkAdvantages? theForkAdvantages;
  final List<TagCategory>? tagCategories;
  final Price? price;
  final List<dynamic>? broadGeo;
  final Page? page;
  final int? cityId;
  final int? countryId;

  const Meta({
    this.city,
    this.filters,
    this.location,
    this.sort,
    this.theForkAdvantages,
    this.tagCategories,
    this.price,
    this.broadGeo,
    this.page,
    this.cityId,
    this.countryId,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        city: json['city'] == null
            ? null
            : City.fromJson(json['city'] as Map<String, dynamic>),
        filters: (json['filters'] as List<dynamic>?)
            ?.map((e) => Filter.fromJson(e as Map<String, dynamic>))
            .toList(),
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, dynamic>),
        sort: (json['sort'] as List<dynamic>?)
            ?.map((e) => Sort.fromJson(e as Map<String, dynamic>))
            .toList(),
        theForkAdvantages: json['theForkAdvantages'] == null
            ? null
            : TheForkAdvantages.fromJson(
                json['theForkAdvantages'] as Map<String, dynamic>),
        tagCategories: (json['tagCategories'] as List<dynamic>?)
            ?.map((e) => TagCategory.fromJson(e as Map<String, dynamic>))
            .toList(),
        price: json['price'] == null
            ? null
            : Price.fromJson(json['price'] as Map<String, dynamic>),
        broadGeo: json['broadGeo'] as List<dynamic>?,
        page: json['page'] == null
            ? null
            : Page.fromJson(json['page'] as Map<String, dynamic>),
        cityId: json['cityId'] as int?,
        countryId: json['countryId'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'city': city?.toJson(),
        'filters': filters?.map((e) => e.toJson()).toList(),
        'location': location?.toJson(),
        'sort': sort?.map((e) => e.toJson()).toList(),
        'theForkAdvantages': theForkAdvantages?.toJson(),
        'tagCategories': tagCategories?.map((e) => e.toJson()).toList(),
        'price': price?.toJson(),
        'broadGeo': broadGeo,
        'page': page?.toJson(),
        'cityId': cityId,
        'countryId': countryId,
      };

  @override
  List<Object?> get props {
    return [
      city,
      filters,
      location,
      sort,
      theForkAdvantages,
      tagCategories,
      price,
      broadGeo,
      page,
      cityId,
      countryId,
    ];
  }
}
