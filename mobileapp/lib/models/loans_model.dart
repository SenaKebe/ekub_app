import 'dart:convert';

class Loans {
  final int id;
  final int lotId;
  final int userId;
  final double amount;
  final DateTime createdAt;

  Loans({
    required this.id,
    required this.lotId,
    required this.userId,
    required this.amount,
    required this.createdAt,
  });

  factory Loans.fromJson(Map<String, dynamic> json) {
    return Loans(
      id: json['id'],
      lotId: json['lotId'],
      userId: json['userId'],
      amount: json['amount'].toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lotId': lotId,
      'userId': userId,
      'amount': amount,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
