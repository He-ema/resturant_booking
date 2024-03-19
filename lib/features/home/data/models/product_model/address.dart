class Address {
  final String street, postalCode, locality, country;

  Address(
      {required this.street,
      required this.postalCode,
      required this.locality,
      required this.country});

  factory Address.fromJson(jsonData) {
    return Address(
      street: jsonData['street'],
      postalCode: jsonData['postalCode'],
      locality: jsonData['locality'],
      country: jsonData['country'],
    );
  }
}
