import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jobizz/features/home/data/models/product_model/product_model.dart';
import 'package:jobizz/features/home/data/repo/home_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final HomeRepo homeRepo;
  ProductCubit(this.homeRepo) : super(ProductInitial());
  Future<void> getHomeProducts() async {
    emit(ProductLoading());
    var result = await homeRepo.getAllProducts();
    print(result);
    result.fold((failure) {
      emit(ProductFailure(errorMessage: failure.errorMessage));
    }, (products) {
      emit(ProductSuccess(products: products));
    });
  }
}
