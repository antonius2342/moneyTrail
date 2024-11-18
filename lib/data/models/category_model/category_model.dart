class Categorymodel {
  final String category;

  Categorymodel({
    required this.category,
  });

  factory Categorymodel.fromJson(Map<String, dynamic> json) {
    return Categorymodel(
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
    };
  }
}