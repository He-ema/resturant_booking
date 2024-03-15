import 'package:equatable/equatable.dart';

import 'restaurant_tag.dart';
import 'sale_type_tag.dart';

class Filter extends Equatable {
  final RestaurantTag? restaurantTag;
  final String? id;
  final int? count;
  final String? type;
  final int? category;
  final SaleTypeTag? saleTypeTag;

  const Filter({
    this.restaurantTag,
    this.id,
    this.count,
    this.type,
    this.category,
    this.saleTypeTag,
  });

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
        restaurantTag: json['restaurantTag'] == null
            ? null
            : RestaurantTag.fromJson(
                json['restaurantTag'] as Map<String, dynamic>),
        id: json['id'] as String?,
        count: json['count'] as int?,
        type: json['type'] as String?,
        category: json['category'] as int?,
        saleTypeTag: json['saleTypeTag'] == null
            ? null
            : SaleTypeTag.fromJson(json['saleTypeTag'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'restaurantTag': restaurantTag?.toJson(),
        'id': id,
        'count': count,
        'type': type,
        'category': category,
        'saleTypeTag': saleTypeTag?.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      restaurantTag,
      id,
      count,
      type,
      category,
      saleTypeTag,
    ];
  }
}
