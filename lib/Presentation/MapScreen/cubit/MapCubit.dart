import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/Presentation/MapScreen/cubit/MapStates.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapCubit extends Cubit<MapStates> {
  MapCubit() : super(MapInitialState());

  static MapCubit get(context) => BlocProvider.of(context);
  String url3 = 'http://mvs.bslmeiyu.com/api/v1/config/place-api-autocomplete?search_text=cairo';
  String ApiKey = 'AIzaSyAkUy7okwe-hJiu_a8bqv1wLczFkymrc9Q';
  // https://maps.googleapis.com/maps/api/place/details/json?place_id=ChIJ674hC6Y_WBQRujtC6Jay33k&key=AIzaSyAkUy7okwe-hJiu_a8bqv1wLczFkymrc9Q
  String url ='https://maps.googleapis.com/maps/api/place//findplacefromtext/json?input=alexandria&inputtype=textquery&key=AIzaSyAkUy7okwe-hJiu_a8bqv1wLczFkymrc9Q';
  String url2 ='https://maps.googleapis.com/maps/api/js?key=AIzaSyAkUy7okwe-hJiu_a8bqv1wLczFkymrc9Q&libraries=places&callback=initMap';

  Location location = new Location();
  late PermissionStatus permissionStatus;
  bool serviceEnabled = false;
  LocationData? locationData;
  Marker? userMarker;

  void getUserLocation() async {
    emit(MapGetUserLocationLoadingState());
    print('first');
    bool permissionGranted = await isPermissionGranted().catchError((error) {
      print('ERROR1 ${error.toString()}');
    });
    if (!permissionGranted) return; // user denied the permission
    bool gpsEnabled = await isServiceEnabled().catchError((error) {
      print('ERROR2 ${error.toString()}');
    });
    if (!gpsEnabled) return; //user didn't allow to open gps services
    if (permissionGranted && gpsEnabled) {
      locationData = await location.getLocation();
      print('second');
      print('Latitude ${locationData!.latitude}');
      print('Longitude ${locationData!.longitude}');
      // location.onLocationChanged.listen((newLocation) {
      //   locationData = newLocation;
      //   print('Latitude2 ${locationData!.latitude}');
      //   print('Longitude2 ${locationData!.longitude}');
      // });
      // location.changeSettings(
      //   accuracy: LocationAccuracy.high
      // );
      userMarker = Marker(
          markerId: MarkerId('My Location'),
          position: LatLng(31.1474592, 30.1126402),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: 'My Location'));
    } else {
      print('=>>>>>Permission Error in gps');
    }
    emit(MapGetUserLocationSuccessState());
  }

  Future<bool> isPermissionGranted() async {
    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
    }
    return permissionStatus == PermissionStatus.granted;
  }

  Future<bool> isServiceEnabled() async {
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }
    return serviceEnabled;
  }

  //
  // Future<String> getPlaceId(String input)async{
  //   final String url = '';
  // }
}