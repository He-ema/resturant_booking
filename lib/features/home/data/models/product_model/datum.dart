import 'package:jobizz/features/home/data/models/product_model/product.dart';

class Datum {
  final List<Product> products;

  Datum({required this.products});

  factory Datum.fromJson(jsonData) {
    return Datum(
      products: (jsonData as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
