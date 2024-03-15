import 'package:dartz/dartz.dart';
import 'package:jobizz/features/home/data/failures/failures.dart';
import 'package:jobizz/features/home/data/models/product_model/product_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductModel>>> getAllProducts();
}
