import 'dart:convert';

class Lots {
  final int id;
  final int? categoryId;
  final int registeredBy;
  final bool isCompleted;
  final DateTime createdAt;
  final int remainingDay;
  final double remainingAmount;
  final double cumulativePayment;

  Lots({
    required this.id,
    this.categoryId,
    required this.registeredBy,
    required this.isCompleted,
    required this.createdAt,
    required this.remainingDay,
    required this.remainingAmount,
    required this.cumulativePayment,
  });

  factory Lots.fromJson(Map<String, dynamic> json) {
    return Lots(
      id: json['id'],
      categoryId: json['categoryId'],
      registeredBy: json['registeredBy'],
      isCompleted: json['isCompleted'],
      createdAt: DateTime.parse(json['createdAt']),
      remainingDay: json['remainingDay'],
      remainingAmount: json['remainingAmount'].toDouble(),
      cumulativePayment: json['cumulativePayment'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryId': categoryId,
      'registeredBy': registeredBy,
      'isCompleted': isCompleted,
      'createdAt': createdAt.toIso8601String(),
      'remainingDay': remainingDay,
      'remainingAmount': remainingAmount,
      'cumulativePayment': cumulativePayment,
    };
  }
}
