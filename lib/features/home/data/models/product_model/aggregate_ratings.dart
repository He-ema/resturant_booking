import 'package:equatable/equatable.dart';

import 'thefork.dart';
import 'tripadvisor.dart';

class AggregateRatings extends Equatable {
  final Thefork? thefork;
  final Tripadvisor? tripadvisor;

  const AggregateRatings({this.thefork, this.tripadvisor});

  factory AggregateRatings.fromJson(Map<String, dynamic> json) {
    return AggregateRatings(
      thefork: json['thefork'] == null
          ? null
          : Thefork.fromJson(json['thefork'] as Map<String, dynamic>),
      tripadvisor: json['tripadvisor'] == null
          ? null
          : Tripadvisor.fromJson(json['tripadvisor'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'thefork': thefork?.toJson(),
        'tripadvisor': tripadvisor?.toJson(),
      };

  @override
  List<Object?> get props => [thefork, tripadvisor];
}
