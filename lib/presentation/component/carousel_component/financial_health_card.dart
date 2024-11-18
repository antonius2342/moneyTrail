import 'package:flutter/material.dart';
import 'package:money_trail_proj/data/models/carousel_model/financial_health_model.dart';

class FinancialHealthCard extends StatelessWidget {
  final FinancialHealth financialHealth;

  const FinancialHealthCard({super.key, required this.financialHealth});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              financialHealth.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Health Score: ${financialHealth.health}'),
          ],
        ),
      ),
    );
  }
}
