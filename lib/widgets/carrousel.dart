// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
//
// import '../models/place.dart';
//
// class CarrouselMap extends StatelessWidget {
//   final List<Place> places;
//   final dynamic onItemChanged;
//
//   CarrouselMap({required this.places, this.onItemChanged});
//
//   _onChange(int page) {
//     onItemChanged(page, places[page]);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider(
//       items: places.map((i) {
//         return Builder(
//           builder: (BuildContext context) {
//             return Container(
//                 width: MediaQuery.of(context).size.width,
//                 margin: const EdgeInsets.symmetric(horizontal: 5.0),
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(8.0),
//                   ),
//                   gradient: LinearGradient(
//                     colors: [
//                       Color(0xFF626487),
//                       Color(0xFF393A51),
//                     ],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     tileMode: TileMode.clamp,
//                   ),
//                 ),
//                 child: _buildCard(i));
//           },
//         );
//       }).toList(),
//       options: CarouselOptions(
//         height: 400.0,
//         aspectRatio: 16 / 9,
//         viewportFraction: 0.8,
//         initialPage: 0,
//         enableInfiniteScroll: true,
//         reverse: false,
//         autoPlay: true,
//         autoPlayInterval: const Duration(seconds: 3),
//         autoPlayAnimationDuration: const Duration(milliseconds: 800),
//         autoPlayCurve: Curves.fastOutSlowIn,
//         enlargeCenterPage: true,
//         onPageChanged: (index, reason) {
//           print('Page changed to index $index due to $reason');
//         },
//         scrollDirection: Axis.horizontal,
//       ),
//     );
//   }
//
//   _buildCard(Place place) {
//     return Row(
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.only(left: 16.0),
//           child: CircleAvatar(
//             backgroundColor: Colors.white,
//             backgroundImage: NetworkImage(place.image),
//             radius: 32.0,
//           ),
//         ),
//         Expanded(
//             child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 4),
//                 child: Text(
//                   place.description,
//                   style: const TextStyle(color: Colors.white, fontSize: 16.0),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 4),
//                 child: Text(
//                   place.address,
//                   style: const TextStyle(color: Colors.white, fontSize: 12.0),
//                   maxLines: 2,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 4),
//                 child: Text(
//                   '${place.city} - ${place.state}',
//                   style: const TextStyle(color: Colors.white, fontSize: 12.0),
//                 ),
//               )
//             ],
//           ),
//         )),
//       ],
//     );
//   }
// }
