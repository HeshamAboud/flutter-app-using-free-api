// import 'dart:async';
// import 'dart:js_interop';
//
// import 'package:bloc_pattern/bloc_pattern.dart';
// import 'package:flutter/material.dart';
//
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// import '../bloc/map_bloc.dart';
// import '../models/place.dart';
// import '../models/userLocation.dart';
// import '../util/colors.dart';
// import '../widgets/carrousel.dart';
//
//
// class Maps extends StatefulWidget {
//   @override
//   _MapsState createState() => _MapsState();
// }
//
// class _MapsState extends State<Maps> with AutomaticKeepAliveClientMixin {
//   @override
//   bool get wantKeepAlive => true;
//
//  // UserLocation userLocation;
//
//   @override
//   Widget build(BuildContext context) {
//     // final blocMap = BlocProvider.of<MapBloc>(context);
//     // final blocGeo = BlocProvider.of<GeolocationBloc>(context);
//
//     final Completer<GoogleMapController> mapController = Completer();
//
//     void _onMapCreated(GoogleMapController controller) {
//       if (!mapController.isCompleted) {
//         mapController.complete(controller);
//       }
//     }
//
//     Future<void> _onItemCarouselChange(Place place, index) async {
//       GoogleMapController controller = await mapController.future;
//       CameraPosition _newPos = CameraPosition(
//         target: LatLng(place.latitude, place.longitude),
//         zoom: 14.5,
//       );
//
//       controller.animateCamera(CameraUpdate.newCameraPosition(_newPos));
//     }
//
//     Future<void> _moveToLocation(latitude, longitude) async {
//       GoogleMapController controller = await mapController.future;
//       CameraPosition _newPos = CameraPosition(
//         target: LatLng(latitude, longitude),
//         zoom: 14.5,
//       );
//
//       controller.animateCamera(CameraUpdate.newCameraPosition(_newPos));
//     }
//
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             Color(AppColors.backgroundColor1),
//             Color(AppColors.backgroundColor2),
//           ],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           tileMode: TileMode.clamp,
//         ),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Container(
//           child: Stack(
//             children: <Widget>[
//               // Padding(
//               //   padding: EdgeInsets.only(top: 16.0),
//               //   child: StreamBuilder<List<Place>>(
//               //     initialData: [],
//               //     stream: blocMap.outPlaces,
//               //     builder: (context, snapshotPlaces) {
//               //       return StreamBuilder<Map<MarkerId, Marker>>(
//               //         initialData: {},
//               //         stream: blocMap.outMarkers,
//               //         builder: (context, snapshotMarkers) {
//               //           if (snapshotPlaces.data.length > 0) {
//               //             return GoogleMap(
//               //               onMapCreated: _onMapCreated,
//               //               markers: Set<Marker>.of(
//               //                   snapshotMarkers.data.isDefinedAndNotNull
//               //                       ? snapshotMarkers.data.values
//               //                       : []),
//               //               myLocationEnabled: true,
//               //               initialCameraPosition: CameraPosition(
//               //                 target: LatLng(snapshotPlaces.data[0].latitude,
//               //                     snapshotPlaces.data[0].longitude),
//               //                 zoom: 13.0,
//               //               ),
//               //             );
//               //           } else {
//               //             return Container();
//               //           }
//               //         },
//               //       );
//               //     },
//               //   ),
//               // ),
//               // Padding(
//               //   padding: EdgeInsets.only(bottom: 16.0),
//               //   child: Align(
//               //     alignment: Alignment.bottomCenter,
//               //     child: StreamBuilder<List<Place>>(
//               //       initialData: [],
//               //       stream: blocMap.outPlaces,
//               //       builder: (context, snapshot) {
//               //         if (snapshot.data.isDefinedAndNotNull) {
//               //           return CarrouselMap(
//               //             onItemChanged: (index, place) {
//               //               blocMap.inFocusPlace.add(place);
//               //               _onItemCarouselChange(place, index);
//               //             },
//               //             places: snapshot.data!,
//               //           );
//               //         } else {
//               //           return Container();
//               //         }
//               //       },
//               //     ),
//               //   ),
//               // ),
//               // Padding(
//               //   padding: EdgeInsets.fromLTRB(16.0, 32.0, 8.0, 16.0),
//               //   child: Align(
//               //     alignment: Alignment.topLeft,
//               //     child: Container(
//               //       width: 45.0,
//               //       height: 45.0,
//               //       child: FittedBox(
//               //         child: StreamBuilder<UserLocation>(
//               //           stream: blocGeo.outUserLocation,
//               //           builder: (context, snapshot) {
//               //             if (snapshot.hasData) {
//               //               return FloatingActionButton(
//               //                   materialTapTargetSize:
//               //                   MaterialTapTargetSize.padded,
//               //                   backgroundColor: Color(0xFF393A51),
//               //                   child: Icon(
//               //                     Icons.person_pin_circle,
//               //                     size: 32.0,
//               //                   ),
//               //                   onPressed: () {
//               //                     _moveToLocation(snapshot.data.latitude,
//               //                         snapshot.data.longitude);
//               //                   });
//               //             } else {
//               //               return Container();
//               //             }
//               //           },
//               //         ),
//               //       ),
//               //     ),
//               //   ),
//               // )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
