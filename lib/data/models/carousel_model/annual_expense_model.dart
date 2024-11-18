// annual expense models
class AnnualExpense {
  final String title;
  final String amount;
  final String income;
  final String expense;

  AnnualExpense({
    required this.title,
    required this.amount,
    required this.income,
    required this.expense,
  });
  factory AnnualExpense.fromJson(Map<String, dynamic> json) {
    return AnnualExpense(
      title: json['title'],
      amount: json['amount'],
       income: json['income'],
        expense: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'amount': amount,
      'income': income,
      'expense': expense,

    };
  }
}
