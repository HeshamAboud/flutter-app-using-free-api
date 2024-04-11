// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../data/repository/store_repository.dart';
// import '../../model/city.dart';
// import '../common/header_widget.dart';
// import '../ui_constants.dart';
// import 'add/add_city_page.dart';
// import 'cities_bloc.dart';
//
//
// class CitiesPage extends StatefulWidget {
//   @override
//   _CitiesPageState createState() => _CitiesPageState();
// }
//
// class _CitiesPageState extends State<CitiesPage> {
//   CitiesBloc? bloc;
//
//   void handleDeleteTap(City city) async {
//     final result = await showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => Center(
//         child: AlertDialog(
//           title: const Text('Confirmación'),
//           content: Text('Seguro que desea eliminar la ciudad ${city.title}?'),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('NO'),
//               onPressed: () => Navigator.of(context).pop(false),
//             ),
//             TextButton(
//               child: const Text('SI'),
//               onPressed: () => Navigator.of(context).pop(true),
//             )
//           ],
//         ),
//       ),
//     );
//     if (result) {
//       bloc?.deleteCity(city);
//     }
//   }
//
//   @override
//   void initState() {
//     bloc = CitiesBloc(
//       storage: context.read<StoreRepository>(),
//     );
//     bloc?.loadCities();
//     super.initState();
//   }
//
//   void handleNavigatePress(BuildContext context) async {
//     await Navigator.of(context).push(
//       PageRouteBuilder(
//         transitionDuration: const Duration(
//           milliseconds: 400,
//         ),
//         pageBuilder: (_, animation1, animation2) {
//           return SlideTransition(
//             position: Tween<Offset>(
//               begin: const Offset(0.0, 1.0),
//               end: const Offset(0.0, 0.0),
//             ).animate(animation1),
//             child: AddCityPage(),
//           );
//         },
//       ),
//     );
//     bloc?.loadCities();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: bloc!,
//       builder: (context, child) {
//         return Scaffold(
//           appBar: AppBar(
//             elevation: 0,
//             backgroundColor: Colors.white,
//             iconTheme: const IconThemeData(
//               color: Colors.black,
//             ),
//           ),
//           floatingActionButton: Padding(
//             padding: const EdgeInsets.only(bottom: 20.0),
//             child: FloatingActionButton(
//               child: const Icon(Icons.add),
//               backgroundColor: primaryColor,
//               onPressed: () => handleNavigatePress(context),
//             ),
//           ),
//           body: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(25),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[
//                    HeaderWidget(
//                      title: 'Mis ciudades',
//                   ),
//                   Expanded(
//                     child: bloc!.cities.isEmpty
//                         ? const Center(
//                             child: Text('No tienes ciudades :('),
//                           )
//                         : ListView.builder(
//                             padding: const EdgeInsets.only(
//                               bottom: 20,
//                             ),
//                             itemCount: bloc?.cities.length,
//                             itemBuilder: (context, index) {
//                               final city = bloc?.cities[index];
//                               return CityItem(
//                                 city: city!,
//                                 onTap: () => handleDeleteTap(city),
//                               );
//                             },
//                           ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
//
// class CityItem extends StatelessWidget {
//   final City city;
//   final VoidCallback onTap;
//
//   const CityItem({
//     Key? key,
//    required this.city,
//     required this.onTap,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Container(
//         color: Colors.grey[200],
//         padding: const EdgeInsets.all(20.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Text(
//               city.title,
//               style: const TextStyle(
//                 fontWeight: FontWeight.w700,
//                 fontSize: 20,
//               ),
//             ),
//             InkWell(
//               onTap: onTap,
//               child: const Icon(
//                 Icons.close,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
