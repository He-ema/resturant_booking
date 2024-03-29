import 'package:jobizz/features/home/data/models/product_model/address.dart';
import 'package:jobizz/features/home/data/models/product_model/geo.dart';
import 'package:jobizz/features/home/data/models/product_model/main_photo.dart';

class Datum {
  final String name;
  final Geo geo;
  final Address address;
  final MainPhoto? mainPhoto;

  Datum({
    required this.name,
    required this.geo,
    required this.address,
    required this.mainPhoto,
  });

  factory Datum.fromJson(jsonData) {
    return Datum(
      name: jsonData['name'],
      geo: Geo.fromJson(jsonData['geo']),
      address: Address.fromJson(jsonData['address']),
      mainPhoto: MainPhoto.fromJson(jsonData['mainPhoto']),
    );
  }
}
