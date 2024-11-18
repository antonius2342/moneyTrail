// on time payment
class Ontimepayment {
  final String title;
  final String amount;
  final String paymenttitle;

  Ontimepayment({
    required this.title,
    required this.amount,
      required this.paymenttitle,
  });

  factory Ontimepayment.fromJson(Map<String, dynamic> json) {
    return Ontimepayment(
      title: json['title'],
      amount: json['amount'],
      paymenttitle: json['paymenttitle'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'amount': amount,
      'paymenttitle': paymenttitle,
    };
  }
}