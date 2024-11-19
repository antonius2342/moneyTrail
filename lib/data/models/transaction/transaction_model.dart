import 'dart:io';
import 'package:hive/hive.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 0)
class TransactionModel extends HiveObject {
  // Unique ID
  @HiveField(0)
  String id;

  // Amount
  @HiveField(1)
  double amount;

  // Currency (based on user's location)
  @HiveField(2)
  String currency;

  // Transaction Type: income, expense, liability, asset, account receivable, equity
  @HiveField(3)
  TransactionType type;

  // Category
  @HiveField(4)
  String category;

  // Account Direction: e.g., Cash, Debit
  @HiveField(5)
  String accountDirection;

  // Date
  @HiveField(6)
  DateTime date;

  // Is Annual (specific for income/expense)
  @HiveField(7)
  bool? isAnnual;

  // Reminder Date (optional for annual income/expense)
  @HiveField(8)
  DateTime? reminderDate;

  // Due Date (required for liability/account receivable)
  @HiveField(9)
  DateTime? dueDate;

  // Appreciation/Depreciation (specific for assets)
  @HiveField(10)
  bool? isDepreciation;

  // Depreciation/Appreciation Percentage
  @HiveField(11)
  double? percentage;

  // Notes
  @HiveField(12)
  String? notes;

  // Attachments (e.g., receipts, documents)
  @HiveField(13)
  List<File>? attachments;

  TransactionModel({
    required this.id,
    required this.amount,
    required this.currency,
    required this.type,
    required this.category,
    required this.accountDirection,
    required this.date,
    this.isAnnual,
    this.reminderDate,
    this.dueDate,
    this.isDepreciation,
    this.percentage,
    this.notes,
    this.attachments,
  });
}

// Enum for Transaction Type
@HiveType(typeId: 1)
enum TransactionType {
  @HiveField(0)
  income,
  
  @HiveField(1)
  expense,
  
  @HiveField(2)
  liability,
  
  @HiveField(3)
  asset,
  
  @HiveField(4)
  accountReceivable,
  
  @HiveField(5)
  equity,
}
