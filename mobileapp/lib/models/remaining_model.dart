import 'dart:convert';

class RemainingPayment {
  final int id;
  final int userId;
  final int lotId;
  final int depositId;
  final double? amountPaid;
  final double? commissionPaid;
  final DateTime paymentDate;

  RemainingPayment({
    required this.id,
    required this.userId,
    required this.lotId,
    required this.depositId,
    this.amountPaid,
    this.commissionPaid,
    required this.paymentDate,
  });

  factory RemainingPayment.fromJson(Map<String, dynamic> json) {
    return RemainingPayment(
      id: json['id'],
      userId: json['userId'],
      lotId: json['lotId'],
      depositId: json['depositId'],
      amountPaid: json['amountPaid']?.toDouble(),
      commissionPaid: json['commissionPaid']?.toDouble(),
      paymentDate: DateTime.parse(json['paymentDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'lotId': lotId,
      'depositId': depositId,
      'amountPaid': amountPaid,
      'commissionPaid': commissionPaid,
      'paymentDate': paymentDate.toIso8601String(),
    };
  }
}
