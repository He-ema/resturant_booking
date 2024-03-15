import 'package:equatable/equatable.dart';

import 'gift_card_tag.dart';
import 'thefork_pay_tag.dart';
import 'yums_tag.dart';

class TheForkAdvantages extends Equatable {
  final List<String>? promos;
  final YumsTag? yumsTag;
  final TheforkPayTag? theforkPayTag;
  final GiftCardTag? giftCardTag;
  final int? yumsRestaurantTag;

  const TheForkAdvantages({
    this.promos,
    this.yumsTag,
    this.theforkPayTag,
    this.giftCardTag,
    this.yumsRestaurantTag,
  });

  factory TheForkAdvantages.fromJson(Map<String, dynamic> json) {
    return TheForkAdvantages(
      promos: json['promos'] as List<String>?,
      yumsTag: json['yumsTag'] == null
          ? null
          : YumsTag.fromJson(json['yumsTag'] as Map<String, dynamic>),
      theforkPayTag: json['theforkPayTag'] == null
          ? null
          : TheforkPayTag.fromJson(
              json['theforkPayTag'] as Map<String, dynamic>),
      giftCardTag: json['giftCardTag'] == null
          ? null
          : GiftCardTag.fromJson(json['giftCardTag'] as Map<String, dynamic>),
      yumsRestaurantTag: json['yumsRestaurantTag'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'promos': promos,
        'yumsTag': yumsTag?.toJson(),
        'theforkPayTag': theforkPayTag?.toJson(),
        'giftCardTag': giftCardTag?.toJson(),
        'yumsRestaurantTag': yumsRestaurantTag,
      };

  @override
  List<Object?> get props {
    return [
      promos,
      yumsTag,
      theforkPayTag,
      giftCardTag,
      yumsRestaurantTag,
    ];
  }
}
