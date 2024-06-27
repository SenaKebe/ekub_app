import 'dart:convert';

class Deposits {
  final int id;
  final int lotId;
  final int userId;
  final int count;
  final double amount;
  final double commition;
  final double remainingAmountPerDeposit;
  final double remainingCommissionPerDeposit;
  final DateTime createdAt;

  Deposits({
    required this.id,
    required this.lotId,
    required this.userId,
    required this.count,
    required this.amount,
    required this.commition,
    required this.remainingAmountPerDeposit,
    required this.remainingCommissionPerDeposit,
    required this.createdAt,
  });

  factory Deposits.fromJson(Map<String, dynamic> json) {
    return Deposits(
      id: json['id'],
      lotId: json['lotId'],
      userId: json['userId'],
      count: json['count'],
      amount: json['amount'].toDouble(),
      commition: json['commition'].toDouble(),
      remainingAmountPerDeposit: json['remainingAmountPerDeposit'].toDouble(),
      remainingCommissionPerDeposit:
          json['remainingCommissionPerDeposit'].toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lotId': lotId,
      'userId': userId,
      'count': count,
      'amount': amount,
      'commition': commition,
      'remainingAmountPerDeposit': remainingAmountPerDeposit,
      'remainingCommissionPerDeposit': remainingCommissionPerDeposit,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
