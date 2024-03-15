import 'package:equatable/equatable.dart';

class Price extends Equatable {
  final List<int>? values;
  final String? currencies;

  const Price({this.values, this.currencies});

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        values: json['values'] as List<int>?,
        currencies: json['currencies'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'values': values,
        'currencies': currencies,
      };

  @override
  List<Object?> get props => [values, currencies];
}
