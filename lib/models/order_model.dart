class OrderModel {
  final String serviceName;
  final DateTime date;

  OrderModel({
    required this.serviceName,
    required this.date,
  });

  // Convert an OrderModel instance to a Map
  Map<String, dynamic> toJson() => {
        'serviceName': serviceName,
        'date': date.toIso8601String(),
      };

  // Create an OrderModel instance from a Map
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      serviceName: json['serviceName'],
      date: DateTime.parse(json['date']),
    );
  }
}
