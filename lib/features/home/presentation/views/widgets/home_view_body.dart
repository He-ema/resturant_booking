import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/features/home/presentation/managers/product_cubit/product_cubit.dart';
import 'package:jobizz/features/home/presentation/views/widgets/custom_header.dart';
import 'package:jobizz/features/home/presentation/views/widgets/home_loading_view.dart';
import 'package:jobizz/features/home/presentation/views/widgets/home_success_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSuccess) {
          return HomeSuccessView(
            state: state,
          );
        } else if (state is ProductFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const Center(
            child: HomeLoadingView(),
          );
        }
      },
    );
  }
}
