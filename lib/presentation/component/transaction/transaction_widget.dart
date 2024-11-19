import 'package:flutter/material.dart';
import 'package:money_trail_proj/data/models/transaction/transaction_model.dart';

class InfoCard extends StatelessWidget {
  final TransactionModel transaction;

  const InfoCard({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Icon or Image based on menu
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.grey[200],
              child: Icon(
                _getIconForMenu(transaction.category),
                size: 28,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(width: 16),

            // Main Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.category,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "\${transaction.amount.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.green,
                    ),
                  ),
                  if (transaction.notes?.isNotEmpty ?? false)
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        transaction.notes ?? '',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  const SizedBox(height: 8),
                  Text(
                    "Date: ${transaction.date.toLocal()}".split(' ')[0],
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }  IconData _getIconForMenu(String menu) {
    switch (menu) {
      case 'Income':
        return Icons.attach_money;
      case 'Expense':
        return Icons.money_off;
      case 'Liability':
        return Icons.warning;
      case 'Asset':
        return Icons.house;
      default:
        return Icons.category;
    }
  }
}
