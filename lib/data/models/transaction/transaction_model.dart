import 'package:hive/hive.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 0)
class Transaction extends HiveObject {
  @HiveField(0)
  double amount;

  @HiveField(1)
  String note;

  @HiveField(2)
  DateTime date;

  @HiveField(3)
  String menu;

  @HiveField(4)
  String category;

  @HiveField(5)
  bool annualOption;

  @HiveField(6)
  bool pushNotification;

  @HiveField(7)
  bool appreciation;

  @HiveField(8)
  double percentage;

  Transaction({
    required this.amount,
    required this.note,
    required this.date,
    required this.menu,
    required this.category,
    this.annualOption = false,
    this.pushNotification = false,
    this.appreciation = false,
    this.percentage = 10.0,
  });
}
