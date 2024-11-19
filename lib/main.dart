import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_trail_proj/data/models/transaction/transaction_model.dart';
import 'package:money_trail_proj/presentation/pages/home_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionModelAdapter());
 await Hive.openBox<TransactionModel>('transactions');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
