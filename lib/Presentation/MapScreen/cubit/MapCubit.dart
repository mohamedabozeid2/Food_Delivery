// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:food_delivery/Presentation/MapScreen/cubit/MapStates.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
//
// class MapCubit extends Cubit<MapStates> {
//   MapCubit() : super(MapInitialState());
//
//   static MapCubit get(context) => BlocProvider.of(context);
//
//   Location location = new Location();
//   late PermissionStatus permissionStatus;
//   bool serviceEnabled = false;
//   LocationData? locationData;
//   Marker? userMarker;
//   CameraPosition? myPosition;
//
//
//   void getUserLocation() async {
//     emit(MapGetUserLocationLoadingState());
//     bool permissionGranted = await isPermissionGranted().catchError((error) {
//       print('ERROR1 ${error.toString()}');
//     });
//     if (!permissionGranted) return; // user denied the permission
//     bool gpsEnabled = await isServiceEnabled().catchError((error) {
//       print('ERROR2 ${error.toString()}');
//     });
//     if (!gpsEnabled) return; //user didn't allow to open gps services
//     if (permissionGranted && gpsEnabled) {
//       locationData = await location.getLocation();
//       // location.onLocationChanged.listen((newLocation) {
//       //   locationData = newLocation;
//       //   print('Latitude2 ${locationData!.latitude}');
//       //   print('Longitude2 ${locationData!.longitude}');
//       // });
//       // location.changeSettings(
//       //   accuracy: LocationAccuracy.high
//       // );
//
//       userMarker = Marker(
//           markerId: MarkerId('My Location'),
//           position: LatLng(locationData!.latitude!, locationData!.longitude!),
//           icon: BitmapDescriptor.defaultMarker,
//           infoWindow: InfoWindow(title: 'My Location'));
//     } else {
//       print('=>>>>>Permission Error in gps');
//     }
//     print('done');
//     emit(MapGetUserLocationSuccessState());
//   }
//
//   Future<bool> isPermissionGranted() async {
//     permissionStatus = await location.hasPermission();
//     if (permissionStatus == PermissionStatus.denied) {
//       permissionStatus = await location.requestPermission();
//     }
//     return permissionStatus == PermissionStatus.granted;
//   }
//
//   String address = '';
//
//
//
//   Future<bool> isServiceEnabled() async {
//     serviceEnabled = await location.serviceEnabled();
//     if (!serviceEnabled) {
//       serviceEnabled = await location.requestService();
//     }
//     return serviceEnabled;
//   }
//
//
//   //
//   // Future<String> getPlaceId(String input)async{
//   //   final String url = '';
//   // }
// }