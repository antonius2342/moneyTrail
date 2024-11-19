import 'package:flutter/material.dart';
import 'package:money_trail_proj/data/models/transaction/transaction_model.dart';
import 'package:money_trail_proj/presentation/component/transaction/transaction_widget.dart';


class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
 

  @override
  Widget build(BuildContext context) {
    List<TransactionModel> transactions = []; // Add this line to define transactions
    return Scaffold(
      appBar: AppBar(title: Text("Activity Page")),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return InfoCard(transaction: transactions[index]); // Changed InfoCard to TransactionWidget
        },
      ),
    );
  }
}
