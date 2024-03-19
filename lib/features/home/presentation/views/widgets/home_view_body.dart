import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/features/home/presentation/managers/product_cubit/product_cubit.dart';
import 'package:jobizz/features/home/presentation/views/widgets/custom_header.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSuccess) {
          return CustomScrollView(
            slivers: [
              const SliverAppBar(
                backgroundColor: Color(0xfff6f6f6),
                automaticallyImplyLeading: false,
                pinned: true,
                expandedHeight: 85,
                collapsedHeight: 85,
                surfaceTintColor: Color(0xfff6f6f6),
                flexibleSpace: FlexibleSpaceBar(
                  background: CustomHeader(),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: List.generate(
                    20,
                    (index) => Container(
                      margin: const EdgeInsets.all(20),
                      height: 50,
                      width: 50,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          );
        } else if (state is ProductFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
