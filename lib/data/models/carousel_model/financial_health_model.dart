//Financial Health Score Model model
class FinancialHealth {
  final String title;
  final String health;

  FinancialHealth({
    required this.title,
    required this.health,
  });

  factory FinancialHealth.fromJson(Map<String, dynamic> json) {
    return FinancialHealth(
      title: json['title'],
      health: json['health'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'health': health,
    };
  }
}