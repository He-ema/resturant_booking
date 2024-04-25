import 'dart:async';
import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jobizz/features/home/data/models/product_model/product_model.dart';

class GoogleMapsViewBody extends StatefulWidget {
  const GoogleMapsViewBody({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  State<GoogleMapsViewBody> createState() => _GoogleMapsViewBodyState();
}

class _GoogleMapsViewBodyState extends State<GoogleMapsViewBody> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final Set<Marker> markers = {};

  // static final CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(Decimal.parse(widget.productModel.geo.latitude).toDouble(), -122.085749655962),
  //   zoom: 14.4746,
  // );
  late CameraPosition _kGooglePlex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _kGooglePlex = CameraPosition(
      target: LatLng(
        double.parse(
          Decimal.parse(widget.productModel.geo.latitude).toString(),
        ),
        double.parse(
          Decimal.parse(widget.productModel.geo.longitude).toString(),
        ),
      ),
      zoom: 14.4746,
    );

    markers.add(
      Marker(
          markerId: const MarkerId('Resturant Location'),
          position: LatLng(
            double.parse(
              Decimal.parse(widget.productModel.geo.latitude).toString(),
            ),
            double.parse(
              Decimal.parse(widget.productModel.geo.longitude).toString(),
            ),
          ),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(
            title: widget.productModel.name,
            snippet: '5 Star Rating',
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      markers: markers,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
