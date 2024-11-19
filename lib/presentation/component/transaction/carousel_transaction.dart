import 'package:flutter/material.dart';

class TransactionTypeCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const TransactionTypeCard({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue[200] : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32),
            SizedBox(height: 8),
            Text(label),
          ],
        ),
      ),
    );
  }
}

class TransactionTypeCarousel extends StatelessWidget {
  final String? selectedTransactionType;
  final Function(String) onTransactionTypeSelected;

  const TransactionTypeCarousel({
    required this.selectedTransactionType,
    required this.onTransactionTypeSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          TransactionTypeCard(
            icon: Icons.attach_money,
            label: "Income",
            isSelected: selectedTransactionType == "Income",
            onTap: () => onTransactionTypeSelected("Income"),
          ),
          TransactionTypeCard(
            icon: Icons.shopping_cart,
            label: "Expense",
            isSelected: selectedTransactionType == "Expense",
            onTap: () => onTransactionTypeSelected("Expense"),
          ),
          TransactionTypeCard(
            icon: Icons.date_range,
            label: "Liability",
            isSelected: selectedTransactionType == "Liability",
            onTap: () => onTransactionTypeSelected("Liability"),
          ),
          TransactionTypeCard(
            icon: Icons.apartment,
            label: "Asset",
            isSelected: selectedTransactionType == "Asset",
            onTap: () => onTransactionTypeSelected("Asset"),
          ),
          TransactionTypeCard(
            icon: Icons.mobile_friendly_sharp,
            label: "Account Receivable",
            isSelected: selectedTransactionType == "Account Receivable",
            onTap: () => onTransactionTypeSelected("Account Receivable"),
          ),
        ],
      ),
    );
  }
}


