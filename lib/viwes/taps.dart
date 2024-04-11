// import 'package:flutter/material.dart';
//
//
// import '../util/colors.dart';
// import 'maps.dart';
//
// class Tabs extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         bottomNavigationBar: Container(
//           color: Color(AppColors.backgroundColor2),
//           child: const TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.place),
//               ),
//               Tab(
//                 icon: Icon(Icons.blur_on),
//               ),
//               Tab(
//                 icon: Icon(Icons.account_box),
//               ),
//               Tab(
//                 icon: Icon(Icons.menu),
//               )
//             ],
//             labelColor: Colors.white,
//             unselectedLabelColor: Colors.white,
//             indicatorSize: TabBarIndicatorSize.tab,
//             indicatorColor: Colors.white,
//             isScrollable: false,
//             // indicator: UnderlineTabIndicator(
//             //   insets: EdgeInsets.fromLTRB(0, 0.0, 0, 45.0),
//             // ),
//           ),
//         ),
//         body: TabBarView(
//           physics: const NeverScrollableScrollPhysics(),
//           children: <Widget>[
//             Maps(),
//             Container(
//               color: Colors.orange,
//             ),
//             Container(
//               color: Colors.lightGreen,
//             ),
//             Container(
//               color: Colors.red,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }