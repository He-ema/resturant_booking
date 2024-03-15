import 'package:equatable/equatable.dart';

class Tripadvisor extends Equatable {
  final dynamic ratingValue;
  final dynamic reviewCount;

  const Tripadvisor({this.ratingValue, this.reviewCount});

  factory Tripadvisor.fromJson(Map<String, dynamic> json) => Tripadvisor(
        ratingValue: json['ratingValue'] as dynamic,
        reviewCount: json['reviewCount'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'ratingValue': ratingValue,
        'reviewCount': reviewCount,
      };

  @override
  List<Object?> get props => [ratingValue, reviewCount];
}
