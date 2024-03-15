import 'package:equatable/equatable.dart';

class RestaurantTag extends Equatable {
  final int? id;
  final String? name;
  final String? slug;
  final bool? indexable;
  final dynamic indexableCityId;
  final int? categoryId;

  const RestaurantTag({
    this.id,
    this.name,
    this.slug,
    this.indexable,
    this.indexableCityId,
    this.categoryId,
  });

  factory RestaurantTag.fromJson(Map<String, dynamic> json) => RestaurantTag(
        id: json['id'] as int?,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        indexable: json['indexable'] as bool?,
        indexableCityId: json['indexableCityId'] as dynamic,
        categoryId: json['categoryId'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'indexable': indexable,
        'indexableCityId': indexableCityId,
        'categoryId': categoryId,
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      slug,
      indexable,
      indexableCityId,
      categoryId,
    ];
  }
}
