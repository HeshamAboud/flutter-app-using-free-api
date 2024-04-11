// import 'dart:async';
// import 'dart:ui';
// import 'package:rxdart/rxdart.dart';
// import 'package:bloc_pattern/bloc_pattern.dart';
// import 'package:location/location.dart';
//
// import '../models/userLocation.dart';
//
// class GeolocationBloc implements BlocBase {
//   UserLocation userLocation;
//
//   final StreamController<UserLocation> _userLocationController =
//   StreamController<UserLocation>();
//
//   Stream<UserLocation> get outUserLocation => _userLocationController.stream;
//
//   GeolocationBloc(this.userLocation) {
//     this._getUserLocation();
//   }
//
//   _getUserLocation() {
//     try {
//       var location = new Location();
//       location.getLocation().then((coords) {
//         userLocation = UserLocation(
//           latitude: coords.latitude,
//           longitude: coords.longitude,
//         );
//
//         _userLocationController.sink.add(userLocation);
//       });
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   @override
//   void dispose() {
//     _userLocationController.close();
//   }
//
//   @override
//   void addListener(VoidCallback listener) {
//     // TODO: implement addListener
//   }
//
//   @override
//   // TODO: implement hasListeners
//   bool get hasListeners => throw UnimplementedError();
//
//   @override
//   void notifyListeners() {
//     // TODO: implement notifyListeners
//   }
//
//   @override
//   void removeListener(VoidCallback listener) {
//     // TODO: implement removeListener
//   }
// }