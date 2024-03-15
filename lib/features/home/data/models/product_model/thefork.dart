import 'package:equatable/equatable.dart';

class Thefork extends Equatable {
  final double? ratingValue;
  final int? reviewCount;

  const Thefork({this.ratingValue, this.reviewCount});

  factory Thefork.fromJson(Map<String, dynamic> json) => Thefork(
        ratingValue: (json['ratingValue'] as num?)?.toDouble(),
        reviewCount: json['reviewCount'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'ratingValue': ratingValue,
        'reviewCount': reviewCount,
      };

  @override
  List<Object?> get props => [ratingValue, reviewCount];
}
