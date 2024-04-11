// import 'package:flutter/material.dart';
// import 'package:flutter_stripe_payment/flutter_stripe_payment.dart';
//
// class PaymentScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Payment Screen'),
//       ),
//       body: Center(
//         child: TextButton(
//           onPressed: () {
//             _startPayment(context);
//           },
//           child: Text('Make Payment'),
//         ),
//       ),
//     );
//   }
//
//   Future<void> _startPayment(BuildContext context) async {
//     try {
//       var paymentMethod = await FlutterStripePayment.paymentRequestWithCardForm();
//       // Process paymentMethod.id and complete the payment
//       print('Payment successful: ${paymentMethod.id}');
//       // Show success message or navigate to the next screen
//     } catch (error) {
//       print('Payment error: $error');
//       // Handle payment error
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_reorderable_grid_view/entities/order_update_entity.dart';
import 'package:flutter_reorderable_grid_view/widgets/widgets.dart';
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _scrollController = ScrollController();
  final _gridViewKey = GlobalKey();
  final _fruits = <String>["apple", "banana", "strawberry"];

  @override
  Widget build(BuildContext context) {
    final generatedChildren = List.generate(
      _fruits.length,
          (index) => Container(
        key: Key(_fruits.elementAt(index)),
        color: Colors.lightBlue,
        child: Text(
          _fruits.elementAt(index),
        ),
      ),
    );

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: ReorderableBuilder(
          children: generatedChildren,
          scrollController: _scrollController,
          onReorder: (List<OrderUpdateEntity> orderUpdateEntities) {
            for (final orderUpdateEntity in orderUpdateEntities) {
              final fruit = _fruits.removeAt(orderUpdateEntity.oldIndex);
              _fruits.insert(orderUpdateEntity.newIndex, fruit);
            }
          },
          builder: (children) {
            return GridView(
              key: _gridViewKey,
              controller: _scrollController,
              children: children,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 8,
              ),
            );
          },
        ),
      ),
    );
  }
}
