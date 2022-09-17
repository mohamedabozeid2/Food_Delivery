import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/Modules/MapScreen/cubit/MapCubit.dart';
import 'package:food_delivery/Modules/MapScreen/cubit/MapStates.dart';
import 'package:food_delivery/Shared/Components/Components.dart';
import 'package:food_delivery/utils/helper.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const Marker googleMarker = Marker(
      markerId: MarkerId('googlePlex'),
      position: LatLng(37.42796133580664, -122.085749655962),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(title: 'GooglePlex'));

  static const CameraPosition myPosition = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(31.1474533, 30.1126394),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  var searchController = TextEditingController();

  @override
  void initState() {
    MapCubit.get(context).getUserLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapCubit, MapStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: state is MapGetUserLocationLoadingState
              ? const Center(child: CircularProgressIndicator())
              : SafeArea(
                child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: textFormFieldWithHint(
                                  context: context,

                                  controller: searchController,
                                  borderColor: Colors.black,
                                  label: 'Search by city',
                                  type: TextInputType.text,

                              ),
                            ),
                            const SizedBox(width: 10.0,),
                            GestureDetector(
                              child: Icon(Icons.search, size: 30),
                              onTap: (){
                                print('tap');
                              },
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition: _kGooglePlex,
                          markers: {
                            googleMarker,
                            MapCubit.get(context).userMarker!
                          },
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                        ),
                      ),
                    ],
                  ),
              ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: _goToTheLake,
            label: Text('My Position'),
            icon: Icon(Icons.directions_boat),
          ),
        );
      },
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(myPosition));
  }
}
