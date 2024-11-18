import 'package:flutter/material.dart';
import 'package:money_trail_proj/data/models/carousel_model/total_balance_model.dart';

class TotalbalanceCard extends StatelessWidget {
  final TotalBalance totalBalance;

  const TotalbalanceCard({super.key, required this.totalBalance});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(totalBalance.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(' ${totalBalance.amount}'),
            Text('Income: ${totalBalance.income}'),
            Text('Expense: ${totalBalance.expense}'),
          ],
        ),
      ),
    );
  }
}
