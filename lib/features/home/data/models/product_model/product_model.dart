import 'package:jobizz/features/home/data/models/product_model/datum.dart';

class ProductModel {
  final Datum data;

  ProductModel({required this.data});

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      data: Datum.fromJson(jsonData['data']),
    );
  }
}
