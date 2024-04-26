import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobizz/constants.dart';
import 'package:jobizz/core/utils/app_styles.dart';
import 'package:jobizz/features/home/data/models/product_model/product_model.dart';
import 'package:jobizz/features/home/presentation/views/widgets/google_maps_view_body.dart';

class GoogleMapsView extends StatelessWidget {
  const GoogleMapsView({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        )),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Resturant Location',
          style: AppStyles.styleSemiBold16.copyWith(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: GoogleMapsViewBody(
        productModel: productModel,
      ),
    );
  }
}
