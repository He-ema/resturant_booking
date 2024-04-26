import 'package:jobizz/constants.dart';

class BookedResturantModel {
  final String name;
  final String address;
  final String image;

  BookedResturantModel(
      {required this.name, required this.address, required this.image});

  factory BookedResturantModel.fromJson(jsonData) {
    return BookedResturantModel(
      name: jsonData[kResturantName],
      address: jsonData[kResturantAddress],
      image: jsonData[kResturantImage],
    );
  }
}
