import 'package:flutter/material.dart';
import 'package:jobizz/features/home/data/models/product_model/product_model.dart';
import 'package:jobizz/features/home/presentation/managers/product_cubit/product_cubit.dart';
import 'package:jobizz/features/home/presentation/views/widgets/resturant_details_view_body.dart';

class ResturantDetailsView extends StatelessWidget {
  const ResturantDetailsView(
      {super.key,
      required this.productModel,
      required this.state,
      required this.type});
  final ProductModel productModel;
  final ProductSuccess state;
  final int type;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f6f6),
      body: ResturantDetailsViewBody(
        type: type,
        productModel: productModel,
        state: state,
      ),
    );
  }
}
