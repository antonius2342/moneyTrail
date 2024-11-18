class TotalBalance {
  final String title;
  final String amount;
  final String income;
  final String expense;

  TotalBalance({
    required this.title,
    required this.amount,
    required this.income,
    required this.expense,
  });

  factory TotalBalance.fromJson(Map<String, dynamic> json){
    return TotalBalance(
      title: json['title'],
      amount: json['amount'],
      income: json['income'],
      expense: json['expense'],
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