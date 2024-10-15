class BookingModel {
  final String serviceId;
  final String userId;
  final DateTime date;
  final String address;

  BookingModel({
    required this.serviceId,
    required this.userId,
    required this.date,
    required this.address,
  });
}
