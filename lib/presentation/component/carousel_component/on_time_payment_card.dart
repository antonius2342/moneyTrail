import 'package:flutter/material.dart';
import 'package:money_trail_proj/data/models/carousel_model/ontime_payment_model.dart';

class OnTimePaymentCard extends StatelessWidget {
  final Ontimepayment onTimePayment;

  const OnTimePaymentCard({super.key, required this.onTimePayment});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(onTimePayment.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Amount: ${onTimePayment.amount}'),
            Text('Payment Title: ${onTimePayment.paymenttitle}'),
          ],
        ),
      ),
    );
  }
}
