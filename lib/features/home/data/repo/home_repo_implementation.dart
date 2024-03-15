import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jobizz/features/home/data/failures/failures.dart';
import 'package:jobizz/features/home/data/models/product_model/product_model.dart';
import 'package:jobizz/features/home/data/repo/home_repo.dart';
import 'package:jobizz/features/home/data/services/api_service.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiService apiService;

  HomeRepoImplementation(this.apiService);
  @override
  Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
    try {
      var data = await apiService.get();
      List<ProductModel> products = [];
      for (var element in data) {
        products.add(ProductModel.fromJson(element));
      }
      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
