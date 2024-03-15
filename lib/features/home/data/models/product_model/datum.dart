import 'package:equatable/equatable.dart';

import 'address.dart';
import 'aggregate_ratings.dart';
import 'best_offer.dart';
import 'contained_in_place.dart';
import 'geo.dart';
import 'highlighted_tag.dart';
import 'main_photo.dart';
import 'marketing_offer.dart';
import 'photos_carousel.dart';
import 'yums_detail.dart';

class Datum extends Equatable {
  final String? name;
  final String? slug;
  final Geo? geo;
  final String? servesCuisine;
  final ContainedInPlace? containedInPlace;
  final int? priceRange;
  final String? currenciesAccepted;
  final Address? address;
  final AggregateRatings? aggregateRatings;
  final MainPhoto? mainPhoto;
  final String? mainPhotoSrc;
  final bool? hasLoyaltyProgram;
  final bool? isBookable;
  final bool? isInsider;
  final String? uuid;
  final MarketingOffer? marketingOffer;
  final BestOffer? bestOffer;
  final bool? canBurnYums;
  final YumsDetail? yumsDetail;
  final List<HighlightedTag>? highlightedTag;
  final List<PhotosCarousel>? photosCarousel;
  final dynamic isBookmarked;
  final String? id;

  const Datum({
    this.name,
    this.slug,
    this.geo,
    this.servesCuisine,
    this.containedInPlace,
    this.priceRange,
    this.currenciesAccepted,
    this.address,
    this.aggregateRatings,
    this.mainPhoto,
    this.mainPhotoSrc,
    this.hasLoyaltyProgram,
    this.isBookable,
    this.isInsider,
    this.uuid,
    this.marketingOffer,
    this.bestOffer,
    this.canBurnYums,
    this.yumsDetail,
    this.highlightedTag,
    this.photosCarousel,
    this.isBookmarked,
    this.id,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        geo: json['geo'] == null
            ? null
            : Geo.fromJson(json['geo'] as Map<String, dynamic>),
        servesCuisine: json['servesCuisine'] as String?,
        containedInPlace: json['containedInPlace'] == null
            ? null
            : ContainedInPlace.fromJson(
                json['containedInPlace'] as Map<String, dynamic>),
        priceRange: json['priceRange'] as int?,
        currenciesAccepted: json['currenciesAccepted'] as String?,
        address: json['address'] == null
            ? null
            : Address.fromJson(json['address'] as Map<String, dynamic>),
        aggregateRatings: json['aggregateRatings'] == null
            ? null
            : AggregateRatings.fromJson(
                json['aggregateRatings'] as Map<String, dynamic>),
        mainPhoto: json['mainPhoto'] == null
            ? null
            : MainPhoto.fromJson(json['mainPhoto'] as Map<String, dynamic>),
        mainPhotoSrc: json['mainPhotoSrc'] as String?,
        hasLoyaltyProgram: json['hasLoyaltyProgram'] as bool?,
        isBookable: json['isBookable'] as bool?,
        isInsider: json['isInsider'] as bool?,
        uuid: json['uuid'] as String?,
        marketingOffer: json['marketingOffer'] == null
            ? null
            : MarketingOffer.fromJson(
                json['marketingOffer'] as Map<String, dynamic>),
        bestOffer: json['bestOffer'] == null
            ? null
            : BestOffer.fromJson(json['bestOffer'] as Map<String, dynamic>),
        canBurnYums: json['canBurnYums'] as bool?,
        yumsDetail: json['yumsDetail'] == null
            ? null
            : YumsDetail.fromJson(json['yumsDetail'] as Map<String, dynamic>),
        highlightedTag: (json['highlightedTag'] as List<dynamic>?)
            ?.map((e) => HighlightedTag.fromJson(e as Map<String, dynamic>))
            .toList(),
        photosCarousel: (json['photosCarousel'] as List<dynamic>?)
            ?.map((e) => PhotosCarousel.fromJson(e as Map<String, dynamic>))
            .toList(),
        isBookmarked: json['isBookmarked'] as dynamic,
        id: json['id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'slug': slug,
        'geo': geo?.toJson(),
        'servesCuisine': servesCuisine,
        'containedInPlace': containedInPlace?.toJson(),
        'priceRange': priceRange,
        'currenciesAccepted': currenciesAccepted,
        'address': address?.toJson(),
        'aggregateRatings': aggregateRatings?.toJson(),
        'mainPhoto': mainPhoto?.toJson(),
        'mainPhotoSrc': mainPhotoSrc,
        'hasLoyaltyProgram': hasLoyaltyProgram,
        'isBookable': isBookable,
        'isInsider': isInsider,
        'uuid': uuid,
        'marketingOffer': marketingOffer?.toJson(),
        'bestOffer': bestOffer?.toJson(),
        'canBurnYums': canBurnYums,
        'yumsDetail': yumsDetail?.toJson(),
        'highlightedTag': highlightedTag?.map((e) => e.toJson()).toList(),
        'photosCarousel': photosCarousel?.map((e) => e.toJson()).toList(),
        'isBookmarked': isBookmarked,
        'id': id,
      };

  @override
  List<Object?> get props {
    return [
      name,
      slug,
      geo,
      servesCuisine,
      containedInPlace,
      priceRange,
      currenciesAccepted,
      address,
      aggregateRatings,
      mainPhoto,
      mainPhotoSrc,
      hasLoyaltyProgram,
      isBookable,
      isInsider,
      uuid,
      marketingOffer,
      bestOffer,
      canBurnYums,
      yumsDetail,
      highlightedTag,
      photosCarousel,
      isBookmarked,
      id,
    ];
  }
}
