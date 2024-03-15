import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String? street;
  final String? postalCode;
  final String? locality;
  final String? country;

  const Address({
    this.street,
    this.postalCode,
    this.locality,
    this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json['street'] as String?,
        postalCode: json['postalCode'] as String?,
        locality: json['locality'] as String?,
        country: json['country'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'street': street,
        'postalCode': postalCode,
        'locality': locality,
        'country': country,
      };

  @override
  List<Object?> get props => [street, postalCode, locality, country];
}
