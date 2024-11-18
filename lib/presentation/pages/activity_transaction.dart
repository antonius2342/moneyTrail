import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction'),
      ),
      body: Column(
        children: [
          //Transaction List

          ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return ;
            },
          ),
        ],
      ),
    );
  }
}
