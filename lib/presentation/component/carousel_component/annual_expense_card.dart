import 'package:flutter/material.dart';
import 'package:money_trail_proj/data/models/carousel_model/annual_expense_model.dart';

class AnnualExpenseCard extends StatelessWidget {
  final AnnualExpense annualExpense;

  const AnnualExpenseCard({super.key, required this.annualExpense});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(annualExpense.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Amount: ${annualExpense.amount}'),
            Text('Income: ${annualExpense.income}'),
            Text('Expense: ${annualExpense.expense}'),
          ],
        ),
      ),
    );
  }
}
