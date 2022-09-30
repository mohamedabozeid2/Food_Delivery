import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutCubit.dart';
import 'package:food_delivery/Presentation/FoodLayoutScreen/Cubit/FoodLayoutStates.dart';
import 'package:food_delivery/Shared/Components/Components.dart';
import 'package:food_delivery/Shared/Constants/Constants.dart';
import 'package:food_delivery/Shared/styles/Themes.dart';
import 'package:food_delivery/core/utils/helper.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  late String address = '';

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();

  // static const CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );

  // static const Marker googleMarker = Marker(
  //     markerId: MarkerId('googlePlex'),
  //     position: LatLng(37.42796133580664, -122.085749655962),
  //     icon: BitmapDescriptor.defaultMarker,
  //     infoWindow: InfoWindow(title: 'GooglePlex'));

  // static CameraPosition myPosition = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(MapCubit.get(context).locationData!.latitude!, MapCubit.get(context).locationData!.longitude!),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  var searchController = TextEditingController();

  @override
  void initState() {
    FoodLayoutCubit.get(context).getUserLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodLayoutCubit, FoodLayoutStates>(
      listener: (context, state) {
        if (state is MapGetUserLocationSuccessState) {
          FoodLayoutCubit.get(context).myPosition = CameraPosition(
              bearing: 192.8334901395799,
              target: LatLng(FoodLayoutCubit.get(context).locationData!.latitude!,
                  FoodLayoutCubit.get(context).locationData!.longitude!),
              tilt: 59.440717697143555,
              zoom: 19.151926040649414);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: state is MapGetUserLocationLoadingState
              ? Center(
                  child: CircularProgressIndicator(
                  color: mainColor,
                ))
              : SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            GoogleMap(
                              mapType: MapType.normal,
                              initialCameraPosition:
                              FoodLayoutCubit.get(context).myPosition!,
                              markers: {FoodLayoutCubit.get(context).userMarker!},
                              onMapCreated: (GoogleMapController controller) {
                                _controller.complete(controller);
                              },
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding:  EdgeInsets.all(Helper.getScreenWidth(context: context)*0.04),
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
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    GestureDetector(
                                      child: const Icon(Icons.search, size: 30),
                                      onTap: () {
                                        print('tap');
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(Helper.getScreenWidth(context: context)*0.03),
                              child: Row(
                                children: [
                                  defaultButton(
                                      text: 'My Position',
                                      backgroundColor: mainColor,
                                      TextColor: Colors.white,
                                      height: 50,
                                      borderRadius: 30,
                                      width: Helper.getScreenWidth(
                                              context: context) *
                                          0.35,
                                      fun: () {
                                        goToMyPosition();
                                      }),
                                  const Spacer(),
                                  defaultButton(
                                      text: 'Add Current Address',
                                      height: 50,
                                      TextColor: Colors.white,
                                      fun: () {
                                        addAddress(
                                          lat: FoodLayoutCubit.get(context)
                                              .locationData!
                                              .latitude!,
                                          lon: FoodLayoutCubit.get(context)
                                              .locationData!
                                              .longitude!,
                                        );
                                      },
                                      backgroundColor: mainColor,
                                      borderRadius: 30,
                                      width: Helper.getScreenWidth(
                                              context: context) *
                                          0.5),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
          // floatingActionButton: state is MapGetUserLocationLoadingState
          //     ? CircularProgressIndicator(
          //         color: Colors.white,
          //       )
          //     : FloatingActionButton.extended(
          //         onPressed: goToMyPosition,
          //         backgroundColor: mainColor,
          //         label: Text('My Position'),
          //       ),
        );
      },
    );
  }

  void addAddress({required double lat, required double lon}) async {
    List<Placemark> placeMarks = await placemarkFromCoordinates(lat, lon);
    widget.address = '';
    widget.address += '${placeMarks.reversed.last.country!} ';
    widget.address += placeMarks.reversed.last.street!;
    FoodLayoutCubit.get(context).updateUserData(
        name: userModel!.name!,
        address: widget.address,
        fromMaps: true,
        phoneNumber: userModel!.phoneNumber!,
        emailAddress: userModel!.emailAddress!,
        context: context);
  }

  Future<void> goToMyPosition() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(FoodLayoutCubit.get(context).myPosition!));
  }
}
